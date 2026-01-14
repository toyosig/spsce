// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, unnecessary_null_comparison
import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/domain/repository/explore_repositry.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends ChangeNotifier {
  final ExploreRepository repository = getIt.get<ExploreRepository>();

  List<CategoryData> mainCategoryList = [];
  List<CategoryData> categoriesList = [];
  final Map<String, List<CategoryData>> _categories = {};
  List<BrandModel> brands = [];
  List<ProductsData> searchResults = [];
  List<ProductsData> filteredResults = [];
  TextEditingController searchController = TextEditingController();
  bool _isLoading = false;
  int currentPage = 1;
  int currentState = 1;
  bool _isLoadingMore = false;
  String? _exploreCatId;
  String? _exploreBrandName;
  String? _exploreCatName;
  String? _exploreBrandId;
  List<String> _suggestions = [];
  bool hasMore = true;
  String? selectedMainCategoryId;
  String? selectedSubCategoryId;
  String? selectedThirdCategoryId;
  String? _selectedCategoryName;
  String selectedSortOption = 'Newest first';

  // --- Applied Filters State ---
  String? appliedSize;
  List<String> appliedColors = [];
  List<String>? appliedBrandIds = [];
  // String? appliedBrandId;
  // String? appliedBrandName;
  List<String>? appliedBrandName = [];

  List<String>? appliedConditions;
  String? appliedShippingFrom;
  double? appliedPrice;
  List<String>? appliedCategories;

  final Map<String, List<CategoryData>> _thirdLevelCategories = {};
  Map<String, List<CategoryData>> get thirdLevelCategories =>
      _thirdLevelCategories;

  bool get isLoadingMore => _isLoadingMore;
  String? get exploreCatId => _exploreCatId;
  String? get exploreBrandId => _exploreBrandId;
  String? get exploreBrandName => _exploreBrandName;
  String? get exploreCatName => _exploreCatName;
  bool get isLoading => _isLoading;
  String? get selectedCategoryName => _selectedCategoryName;
  List<String> get suggestions => _suggestions;
  Map<String, List<CategoryData>> get categories => _categories;

  void setMainCategoryList(List<CategoryData> mainCategoryList) {
    this.mainCategoryList = mainCategoryList;
    notifyListeners();
  }

  void setCategoriesList(List<CategoryData> categoriesList) {
    this.categoriesList = categoriesList;
    notifyListeners();
  }

  void setBrands(List<BrandModel> brands) {
    this.brands = brands;
    notifyListeners();
  }

  void setIsLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  void setSuggestions(List<String> suggestions) {
    _suggestions = suggestions;
  }

  void setExploreCatId({required String? id, String? name}) {
    if (id == null) {
      _exploreCatId = null;
      _exploreCatName = null;
    } else {
      _exploreCatId = id;
      _exploreCatName = name;
    }
    notifyListeners();
  }

  void setExploreBrandId({required String? id, String? name}) {
    if (id == null) {
      _exploreBrandId = null;
      _exploreBrandName = null;
    } else {
      _exploreBrandId = id;
      _exploreBrandName = name;
    }
    notifyListeners();
  }

  void setSelectedCategory({
    String? mainCategoryId,
    String? subCategoryId,
    String? thirdCategoryId,
    String? name,
  }) {
    if (selectedMainCategoryId == mainCategoryId &&
        selectedSubCategoryId == subCategoryId &&
        selectedThirdCategoryId == thirdCategoryId) {
      selectedMainCategoryId = null;
      selectedSubCategoryId = null;
      selectedThirdCategoryId = null;
      _selectedCategoryName = null;
    } else {
      currentState = 2;
      selectedMainCategoryId = mainCategoryId;
      selectedSubCategoryId = subCategoryId;
      selectedThirdCategoryId = thirdCategoryId;
      _selectedCategoryName = name;
    }
    notifyListeners();
  }

  void setCurrentState(int page) {
    currentState = page;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clear() {
    searchController.clear();
  }

  void setSearchResults(List<ProductsData> products, {bool add = false}) {
    final nonNullProducts = products.where((p) => p != null).toList();

    if (add) {
      searchResults.addAll(nonNullProducts);
    } else {
      searchResults = nonNullProducts;
    }

    filteredResults = [...searchResults];

    notifyListeners();
  }

  Future<void> loadExploreData(BuildContext context) async {
    LoadingHelper.showLoading(context);
    await loadMainCategory(context);
    await getBrands(context);
    for (var mainCategory in mainCategoryList) {
      await getCategoryByMainCatId(context, mainCategory.id ?? '');
    }
    if (context.mounted) {
      LoadingHelper.hideLoading(context);
    }
  }

  Future<void> loadMainCategory(BuildContext context) async {
    try {
      final result = await repository.getMainCategory();
      setMainCategoryList(result.data ?? []);
    } catch (e) {
      // MessageHelper.showErrorMessage(
      //   context,
      //   'Error fetching explore data: $e',
      // );
      log("error loadMainCategory: $e");
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCategoryByMainCatId(
    BuildContext context,
    String categoryId,
  ) async {
    try {
      final response = await repository.getCategory(categoryId);
      _categories[categoryId] = response.data ?? [];
    } catch (e) {
      // MessageHelper.showErrorMessage(
      //   context,
      //   'Error fetching subcategories: $e',
      // );
      log("error getCategoryByMainCatId: $e");
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getBrands(BuildContext context) async {
    try {
      final response = await repository.getBrands();
      setBrands(response.data ?? []);
    } catch (e) {
      // MessageHelper.showErrorMessage(
      //   context,
      //   'Error fetching explore data: $e',
      // );
      log("error getBrands: $e");
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getProductsByCategory(
    BuildContext context, {
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMore || isLoadMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPage = 1;
      setIsLoading(true);
    }
    final id = exploreCatId;
    if (id == null) return;
    try {
      final response = await repository.getProductsByCategory(
        id: id,
        limit: 20,
        page: currentPage,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setSearchResults(response.data!, add: isLoadMore);
          currentPage++;
        } else {
          setSearchResults(response.data!);
          setCurrentState(2);
        }
        hasMore = currentPage <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
      // MessageHelper.showErrorMessage(context, e.toString());
      log("error getProductsByCategory: $e");
    } finally {
      setIsLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> getProductsByBrand(
    BuildContext context, {
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMore || isLoadMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPage = 1;
      setIsLoading(true);
    }
    final id = exploreBrandId;
    if (id == null) return;
    try {
      final response = await repository.getProductsByBrand(
        id: id,
        limit: 20,
        page: currentPage,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setSearchResults(response.data!, add: isLoadMore);
          currentPage++;
        } else {
          setSearchResults(response.data!);
          setCurrentState(2);
        }
        hasMore = currentPage <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
      // MessageHelper.showErrorMessage(context, e.toString());
      log("error getProductsByBrand: $e");
    } finally {
      setIsLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  void sortSearchResults(String selectedOption) {
    selectedSortOption = selectedOption;

    final List<ProductsData> modifiableList = [...filteredResults];

    if (selectedOption == 'Newest first') {
      modifiableList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    } else if (selectedOption == 'Oldest first') {
      modifiableList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    } else if (selectedOption == 'Price low to high') {
      modifiableList.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (selectedOption == 'Price high to low') {
      modifiableList.sort((a, b) => b.price!.compareTo(a.price!));
    } else if (selectedOption == 'Most Popular') {
      modifiableList.sort(
        (a, b) => (b.likeCount ?? 0).compareTo(a.likeCount ?? 0),
      );
    }

    filteredResults = modifiableList;
    notifyListeners();
  }

  // void filterSearchResults({
  //   String? category,
  //   String? size,
  //   List<String>? colors,
  //   String? brandId,
  //   String? condition,
  //   String? shippingFrom,
  //   double? price,
  // }) {
  //   // Track applied filters
  //   setAppliedFilters(
  //     size: size,
  //     colors: colors,
  //     brandId: brandId,
  //     category: category,
  //     brandName: brandId == null
  //         ? null
  //         : (() {
  //             final match = brands.where((b) => b.id == brandId);
  //             return match.isNotEmpty ? match.first.name : null;
  //           })(),
  //     price: price,
  //     condition: condition,
  //     shippingFrom: shippingFrom,
  //   );

  //   filteredResults = [];

  //   for (final product in searchResults) {
  //     if (product == null) continue;

  //     try {
  //       final matchesSize =
  //           size == null ||
  //           size.trim().isEmpty ||
  //           product.sizes?.entries
  //                   .expand(
  //                     (entry) =>
  //                         entry.value.map((v) => '${entry.key}-${v.value}'),
  //                   )
  //                   .join(', ')
  //                   .trim()
  //                   .toLowerCase() ==
  //               size.trim().toLowerCase();

  //       final matchesColor =
  //           colors == null ||
  //           colors.isEmpty ||
  //           _matchesAnyColor(product.color, colors);
  //           final matchesCategory =
  //           category == null ||
  //           category.trim().isEmpty ||
  //           _matchesCategory(product.subCategory?.name, category) ||
  //           (product.category?.name?.trim().toLowerCase() ==
  //               category.trim().toLowerCase());
  //       final matchesPrice =
  //           price == null || _matchesAnyPrice(product.price, price);

  //       final matchesCondition =
  //           condition == null ||
  //           condition.trim().isEmpty ||
  //           product.condition?.trim().toLowerCase() ==
  //               condition.trim().toLowerCase();

  //       final matchesBrand =
  //           brandId == null ||
  //           brandId.trim().isEmpty ||
  //           (product.brandId?.trim() == brandId.trim());

  //       final matchesShippingFrom =
  //           shippingFrom == null ||
  //           shippingFrom.trim().isEmpty ||
  //           product.shippingFrom?.name?.trim().toLowerCase() ==
  //               shippingFrom.trim().toLowerCase();

  //       if (matchesSize &&
  //           matchesColor &&
  //           matchesBrand &&
  //           matchesCondition &&
  //           matchesPrice &&
  //           matchesCategory &&
  //           matchesShippingFrom) {
  //         filteredResults.add(product);
  //       }
  //     } catch (e, stack) {
  //       if (kDebugMode) {
  //         log("❌ Error filtering product: $e");
  //       }
  //       if (kDebugMode) {
  //         log(stack.toString());
  //       }
  //     }
  //   }

  //   notifyListeners();
  // }

  void filterSearchResults({
    List<String>? categories,
    String? size,
    List<String>? colors,
    List<String>? brandIds, //  <-- changed
    List<String>? conditions,
    String? shippingFrom,
    double? price,
  }) {
    // 1) Track applied filters
    setAppliedFilters(
      size: size,
      colors: colors,
      brandIds: brandIds,
      categories: categories,
      brandName: (brandIds == null || brandIds.isEmpty)
          ? null
          : brands
                .where((b) => brandIds.contains(b.id))
                .map((b) => b.name) // String?  (because name can be null)
                .where((n) => n != null) // drop nulls
                .cast<String>() // promote Iterable<String?> → List<String>
                .toList(),
      // return match.isNotEmpty ? match.first.name : null;
      price: price,
      conditions: conditions,
      shippingFrom: shippingFrom,
    );

    filteredResults = [];

    for (final product in searchResults) {
      if (product == null) continue;

      try {
        final matchesSize =
            size == null ||
            size.trim().isEmpty ||
            product.sizes?.entries
                    .expand(
                      (entry) =>
                          entry.value.map((v) => '${entry.key}-${v.value}'),
                    )
                    .join(', ')
                    .trim()
                    .toLowerCase() ==
                size.trim().toLowerCase();

        final matchesColor =
            colors == null ||
            colors.isEmpty ||
            _matchesAnyColor(product.color, colors);

        final matchesCategory =
            categories == null ||
            categories.isEmpty ||
            _matchesAnyCategory(
              product.category?.name,
              product.subCategory?.name,
              categories,
            );

        final matchesPrice =
            price == null || _matchesAnyPrice(product.price, price);

        final matchesCondition =
            conditions == null ||
            conditions.isEmpty ||
            (product.condition != null &&
                conditions
                    .map((c) => c.trim().toLowerCase())
                    .contains(product.condition!.trim().toLowerCase()));

        final matchesBrand =
            brandIds == null ||
            brandIds.isEmpty ||
            (product.brandId != null &&
                brandIds.contains(product.brandId!.trim()));

        final matchesShippingFrom =
            shippingFrom == null ||
            shippingFrom.trim().isEmpty ||
            product.shippingFrom?.name?.trim().toLowerCase() ==
                shippingFrom.trim().toLowerCase();

        if (matchesSize &&
            matchesColor &&
            matchesBrand &&
            matchesCondition &&
            matchesPrice &&
            matchesCategory &&
            matchesShippingFrom) {
          filteredResults.add(product);
        }
      } catch (e, stack) {
        if (kDebugMode) {
          log("❌ Error filtering product: $e");
          log(stack.toString());
        }
      }
    }

    notifyListeners();
  }

  bool _matchesAnyColor(String? productColor, List<String> filterColors) {
    if (productColor == null || productColor.trim().isEmpty) {
      return false;
    }

    final productColors = productColor
        .toLowerCase()
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return filterColors.any(
      (filterColor) => productColors.contains(filterColor.trim().toLowerCase()),
    );
  }

  bool _matchesAnyCategory(
    String? productCategory,
    String? productSubCategory,
    List<String> filterCategories,
  ) {
    final values = filterCategories
        .map((e) => e.trim().toLowerCase())
        .where((e) => e.isNotEmpty)
        .toSet();
    final pc = productCategory?.trim().toLowerCase();
    final ps = productSubCategory?.trim().toLowerCase();
    return (pc != null && values.contains(pc)) ||
        (ps != null && values.contains(ps));
  }

  bool _matchesAnyPrice(dynamic productPrice, double maxPrice) {
    if (productPrice == null) return false;
    final parsedPrice = productPrice is String
        ? double.tryParse(productPrice)
        : productPrice as double?;

    if (parsedPrice == null) return false;

    return parsedPrice <= maxPrice;
  }

  bool matchesAny(String? fieldValue, List<String> values) {
    if (fieldValue == null || fieldValue.trim().isEmpty) return false;

    final cleaned = fieldValue
        .toLowerCase()
        .split(',')
        .map((e) => e.trim())
        .toList();
    return values.any((val) => cleaned.contains(val.trim().toLowerCase()));
  }

  // --- Setters for Applied Filters ---
  void setAppliedFilters({
    String? size,
    List<String>? colors,
    List<String>? brandIds, //  <-- changed
    List<String>? brandName,
    List<String>? conditions,
    String? shippingFrom,
    double? price,
    List<String>? categories,
  }) {
    appliedSize = size;
    appliedColors = colors ?? [];
    appliedBrandIds = brandIds;
    appliedBrandName = brandName;
    appliedConditions = conditions;
    appliedShippingFrom = shippingFrom;
    appliedPrice = price;
    appliedCategories = categories;
    notifyListeners();
  }

  void removeAppliedColor(String color) {
    appliedColors.remove(color);
    notifyListeners();
  }

  void removeAppliedSize() {
    appliedSize = null;
    notifyListeners();
  }

  void removeAppliedBrand({String? id}) {
    if (id == null) {
      appliedBrandIds = null; // remove all
    } else {
      appliedBrandIds?.remove(id);
      if (appliedBrandIds?.isEmpty == true) appliedBrandIds = null;
    }
    notifyListeners();
  }

  void removeAppliedPrice() {
    appliedPrice = null;
    notifyListeners();
  }

  void removeAppliedCondition({String? condition}) {
    if (condition == null) {
      appliedConditions = null;
    } else {
      appliedConditions = (appliedConditions ?? [])
          .where((c) => c != condition)
          .toList();
      if (appliedConditions!.isEmpty) appliedConditions = null;
    }
    notifyListeners();
  }

  void removeAppliedCategory({String? category}) {
    if (category == null) {
      appliedCategories = null;
    } else {
      appliedCategories = (appliedCategories ?? [])
          .where((c) => c != category)
          .toList();
      if (appliedCategories!.isEmpty) appliedCategories = null;
    }
    notifyListeners();
  }

  void removeAppliedShippingFrom() {
    appliedShippingFrom = null;
    notifyListeners();
  }

  Future<void> getThirdLevelCategoriesBySubCatId(
    BuildContext context,
    String subCategoryId,
  ) async {
    try {
      final response = await repository.getSubCategories(subCategoryId);
      _thirdLevelCategories[subCategoryId] = response.data ?? [];
    } catch (e) {
      // MessageHelper.showErrorMessage(
      //   context,
      //   'Error fetching third-level categories: '
      //   '[31m$e[0m',
      // );
      log("error getThirdLevelCategoriesBySubCatId: $e");
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getSuggestions({required String query}) async {
    if (query.isEmpty) return;
    try {
      final response = await repository.fetchSearchSuggestions(query);
      setSuggestions(response.suggestions);
    } catch (e) {
      setSuggestions([]);
    }
    notifyListeners();
  }

  Future<void> searchProducts(
    BuildContext context, {
    String? brand,
    String? color,
    int? priceMin,
    int? priceMax,
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    final keyword = searchController.text.trim();
    setExploreBrandId(id: null);
    setExploreBrandId(id: null);
    if (isLoadMore) {
      if (!hasMore || isLoadMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPage = 1;
      setIsLoading(true);
    }
    if (keyword.isEmpty) {
      setCurrentState(1);
      return;
    } else {
      setCurrentState(2);
    }
    try {
      final response = await repository.searchProducts(
        query: keyword,
        brand: brand,
        color: color,
        priceMin: priceMin,
        priceMax: priceMax,
        page: currentPage,
        limit: 10,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setSearchResults(response.data!, add: isLoadMore);
        } else {
          setSearchResults(response.data!);
        }
        currentPage++;
        hasMore = currentPage <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
      //  MessageHelper.showErrorMessage(context, e.toString());
      log("error searchProducts: $e");
    } finally {
      setIsLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }
}

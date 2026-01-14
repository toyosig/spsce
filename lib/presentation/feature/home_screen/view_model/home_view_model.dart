// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/home/products_response_model.dart';
import 'package:circ/domain/repository/home_repository.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/home/products_data.dart';
import '../../../../utils/helpers/loading_helpers.dart';
import '../../cart_screen/view_model/cart_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repository = getIt.get<HomeRepository>();

  TabController? tabController;
  final ScrollController forYouScrollController = ScrollController();
  final ScrollController followingScrollController = ScrollController();

  // String? _selectedCategoryId;
  int _currentIndex = 0;
  int _currentHomeTabIndex = 0;
  int _likeCount = 0;
  bool _isLoading = false;
  bool isLiked = false;
  int currentPageForYou = 1;
  int currentPageFollowing = 1;
  bool isRefreshing = false;
  bool _isLoadingMore = false;
  bool hasMoreForYou = true;
  bool hasMoreFollowing = true;

  final bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  int get likeCount => _likeCount;

  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;

  int get currentHomeTabIndex => _currentHomeTabIndex;

  List<ProductsData> forYouProducts = [];
  List<ProductsData> followingProducts = [];
  ProductsData _productDetails = ProductsData();
  ProductsResponseModel? forYouProdModel;
  ProductsResponseModel? followingProdModel;

  int get currentIndex => _currentIndex;
  ProductsData get productDetails => _productDetails;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void setSearchMode(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  void setForYouProductsList(List<ProductsData> products, {bool? add = false}) {
    if (add == true) {
      forYouProducts = List.from(forYouProducts)..addAll(products);
    } else {
      forYouProducts = products;
    }
    notifyListeners();
  }

  int toggleLike() {
    isLiked = !isLiked;
    _likeCount += isLiked ? 1 : -1;
    notifyListeners();
    return _likeCount;
  }

  void setFollowingProductsList(List<ProductsData> list, {bool? add = false}) {
    if (add == true) {
      followingProducts = List.from(followingProducts)..addAll(list);
    } else {
      followingProducts = list;
    }
    notifyListeners();
  }

  void setSearchProductsList(List<ProductsData> products) {
    forYouProducts = products;
    notifyListeners();
  }

  void setIndex(int index) {
    _currentIndex = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void clearDetailproduct() {
    _productDetails = ProductsData();
    notifyListeners();
  }

  void updateIndex(int index, BuildContext context) async {
    if (_currentIndex == index && index == 0) {
      scrollHomeTabToTop();
      await Future.delayed(const Duration(milliseconds: 400));
      isRefreshing = true;
      notifyListeners();
      await getForYouProducts(isRefresh: true);
      isRefreshing = false;
      notifyListeners();
    } else if (index == 2) {
      // Check if it's the user's first sale when Sell button is clicked
      final profileVm = getIt.get<ProfileViewModel>();
      final isFirstSale = await profileVm.getIsFirstSale();
      
      if (isFirstSale) {
        // Navigate to FirstSellScreen if it's the first sale
        if (context.mounted) {
          context.pushNamed(Routes.firstSale.name);
        }
      } else {
        // Proceed with normal navigation to sell screen
        _currentIndex = index;
        notifyListeners();
      }
    } else {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void setCurrentHomeTab(int index) {
    _currentHomeTabIndex = index;
  }

  void scrollHomeTabToTop() {
    final controller = _currentHomeTabIndex == 0
        ? forYouScrollController
        : followingScrollController;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 50), () {
        if (controller.hasClients) {
          controller.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          debugPrint('❌ Controller has no clients yet — still not mounted?');
        }
      });
    });
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setIsLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  @override
  void dispose() {
    forYouScrollController.dispose();
    followingScrollController.dispose();
    super.dispose();
  }

  Future<void> init(BuildContext context, {String? id}) async {
    if (await SecureStorageService.isGuestUser()) {
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      await getForYouProducts(isRefresh: true);
      if (id != null && context.mounted) {
        await getProductsById(context, id: id);
      }
      return;
    }
    getIt.get<AuthViewModel>().getEnv(context);
    if (id == null) {
      await getForYouProducts(isRefresh: true);
      await getFollowingProducts(isRefresh: true);
    }
    if (id != null && context.mounted) {
      await getProductsById(context, id: id);
    }
    if (context.mounted) getIt.get<CartViewModel>().getCart(context);
    notifyListeners();
  }

  Future<void> getForYouProducts({
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreForYou || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPageForYou = 1;
      setLoading(true);
    }
    try {
      final response = await _repository.getForYouProducts(
        limit: 10,
        page: currentPageForYou,
      );
      if (response.success == true && response.data != null) {
        forYouProdModel = ProductsResponseModel(success: response.success);
        if (isLoadMore) {
          setForYouProductsList(response.data!, add: isLoadMore);
          currentPageForYou++;
        } else {
          setForYouProductsList(response.data!);
          currentPageForYou = 2;
        }
        hasMoreForYou = currentPageForYou <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error getForYouProducts: $e");
    } finally {
      setLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> getFollowingProducts({
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreFollowing || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      setLoading(true);
      if (isRefresh) currentPageFollowing = 1;
      notifyListeners();
    }

    try {
      final response = await _repository.getFollowingProducts(
        limit: 10,
        page: currentPageFollowing,
      );
      if (response.success == true && response.data != null) {
        followingProdModel = ProductsResponseModel(success: response.success);
        if (isLoadMore) {
          setFollowingProductsList(response.data!, add: isLoadMore);
          currentPageFollowing++;
        } else {
          setFollowingProductsList(response.data!);
          currentPageFollowing = 2;
        }
        hasMoreFollowing = currentPageFollowing <= response.totalPages!;
      }
    } catch (e) {
      log("error getFollowingProducts: $e");
    }
    setLoading(false);
    setIsLoadingMore(false);
    notifyListeners();
  }

  Future<void> getProductsById(BuildContext context, {String? id}) async {
    setLoading(true);
    try {
      final result = await _repository.getProductById(id: id);
      if (result.success == false) {
        if (!context.mounted) return;
        return;
      }
      _productDetails = result.data ?? ProductsData();
    } catch (e) {
      if (!context.mounted) return;
      log("error getProductsById: $e");
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
    }
  }

  Future<void> toggleFavourite(BuildContext context, {String? id}) async {
    try {
      final result = await _repository.toggleFavourite(id: id);
      if (!context.mounted) return;
      if (result.data?.product != null) {
        updateProductInLists(id, result.data!.product);
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error in data source during toggleFavourite: $e');
      }
    }
  }

  /// Finds and replaces a product by ID in both forYouProducts and myFavProducts lists
  void updateProductInLists(String? productId, ProductsData updatedProduct) {
    if (productId == null) return;

    // Update _productDetails if it matches the updated product ID
    if (_productDetails.id == productId) {
      _productDetails = _productDetails.copyWith(
        title: updatedProduct.title,
        description: updatedProduct.description,
        price: updatedProduct.price,
        quantity: updatedProduct.quantity,
        color: updatedProduct.color,
        photos: updatedProduct.photos,
        video: updatedProduct.video,
        tags: updatedProduct.tags,
        condition: updatedProduct.condition,
        brandId: updatedProduct.brandId,
        subCategoryId: updatedProduct.subCategoryId,
        shippingFromId: updatedProduct.shippingFromId,
        shippingTo: updatedProduct.shippingTo,
      );
    }

    // Update in forYouProducts list
    final forYouIndex = forYouProducts.indexWhere(
      (product) => product.id == productId,
    );
    if (forYouIndex != -1) {
      final updatedForYouList = List<ProductsData>.from(forYouProducts);
      updatedForYouList[forYouIndex] = updatedProduct;
      forYouProducts = updatedForYouList;
    }

    // Update in followingProducts list
    final followingIndex = followingProducts.indexWhere(
      (product) => product.id == productId,
    );
    if (followingIndex != -1) {
      final updatedFollowingList = List<ProductsData>.from(followingProducts);
      updatedFollowingList[followingIndex] = updatedProduct;
      followingProducts = updatedFollowingList;
    }
    notifyListeners();
  }

  /// Removes a product by ID from both forYouProducts and followingProducts lists
  void removeProductFromLists(String? productId) {
    if (productId == null) return;
    forYouProducts = forYouProducts
        .where((product) => product.id != productId)
        .toList();
    followingProducts = followingProducts
        .where((product) => product.id != productId)
        .toList();
    getIt.get<ProfileViewModel>().removeProductFromMyList(productId);
    notifyListeners();
  }

  Future<void> removeProduct(BuildContext context, {String? id}) async {
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.removeProduct(id: id);
      if (result.success == false) {
        if (!context.mounted) return;
        MessageHelper.showErrorMessage(context, result.message);
        return;
      }
      removeProductFromLists(id);
      context.pop();
      if (!context.mounted) return;
      MessageHelper.showSuccessMessage(context, result.message);
    } catch (e) {
      if (kDebugMode) log('Error in data source during removeProduct: $e');
    } finally {
      if (context.mounted) LoadingHelper.hideLoading(context);
      setLoading(false);
    }
  }
}

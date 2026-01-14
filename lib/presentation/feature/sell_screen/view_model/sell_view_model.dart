// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:circ/data/models/home/add_product_req_model.dart';
import 'package:circ/data/models/user_model/register_seller_request_model.dart';
import 'package:circ/domain/repository/sell_product_repository.dart';
import 'package:circ/domain/services/dojah_service.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/size_bottom_sheet.dart';
import 'package:circ/utils/custom_widgets/order_action_dialog_box.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../data/models/home/products_data.dart' as product_models;
import '../../../../data/models/home/products_data.dart';
import '../../../../utils/helpers/loading_helpers.dart';
import '../../home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

class SellViewModel extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController addBrandController = TextEditingController();
  final TextEditingController brandSearchController = TextEditingController();

  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final thirdFocus = FocusNode();
  final forthFocus = FocusNode();

  SellViewModel() {
    // Initialize with default quantity
    quantityController.text = '1';

    fNameController.addListener(_recomputePersonalBillingComplete);
    dateOfBirthController.addListener(_recomputePersonalBillingComplete);
    phoneNumberController.addListener(_recomputePersonalBillingComplete);
    streetAddressController.addListener(_recomputePersonalBillingComplete);
    areaController.addListener(_recomputePersonalBillingComplete);
    stateController.addListener(_recomputePersonalBillingComplete);
  //  postalCodeController.addListener(_recomputePersonalBillingComplete);
    bankNameController.addListener(invalidateAccountVerification);
    accountNumberController.addListener(invalidateAccountVerification);
  }

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
 // final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bvnController = TextEditingController();
  final TextEditingController ninController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  FocusNode priceFocus = FocusNode();
  FocusNode dropdownFocus = FocusNode();

  final ImagePicker _picker = ImagePicker();
  final SellProductRepository _repository = getIt.get<SellProductRepository>();

  final List<String> selectedColors = [];
  List<String> selectedImages = [];
  List<CategoryData> mainCategories = [];
  List<CategoryData> categories = [];
  List<CategoryData> subCategories = [];
  List<BrandModel> brands = [];
  List<ShippingFromModel> shipFromList = [];
  List<ShippingToOption> shipToList = [];
  CategoryData? selectedMainCategory;
  CategoryData? selectedCategory;
  CategoryData? selectedSubCategory;
  double? selectedPriceRange;
  BrandModel? selectedBrandModel;
  List<BrandModel> selectedBrands = [];

  ConditionOptions? selectedCondition;
  SizeOption? selectedSizeOption;
  ShippingFromModel? selectedShippingFromModel;
  ShippingToOption? selectedShippingToModel;

  DateTime? dob;
  XFile? _pickedImage;
  XFile? _pickedVideo;
  String? _videoThumbnail;
  String selectedPayment = '';
  int _currentLevel = 0;
  int _currentPage = 0;
  bool _isLoading = false;
  List<String> _tags = [];
  String _selectedCity = '';
  bool _isPersonalBillingComplete = false;
  String _countryCode = '+234';

  // KYC Verification properties
  bool _isKYCVerified = false;
  String? _verifiedBVN;
  String? _verifiedNIN;
  Map<String, dynamic>? _kycVerificationData;

  Map<String, List<product_models.SizeValue>> groupedSizes = {};

  List<String> selectedSizeIds = [];
  List<String> selectedFilterCategories = [];
  List<String> selectedFilterConditions = [];

  XFile? get pickedImage => _pickedImage;
  XFile? get pickedVideo => _pickedVideo;
  List<String> get tags => _tags;
  String? get videoThumbnail => _videoThumbnail;
  int get currentLevel => _currentLevel;
  int get currentPage => _currentPage;
  bool get isLoading => _isLoading;
  String get selectedCity => _selectedCity;
  bool get isPersonalBillingComplete => _isPersonalBillingComplete;
  String get countryCode => _countryCode;

  // KYC Verification getters
  bool get isKYCVerified => _isKYCVerified;
  String? get verifiedBVN => _verifiedBVN;
  String? get verifiedNIN => _verifiedNIN;
  Map<String, dynamic>? get kycVerificationData => _kycVerificationData;

  ///***********************************Setters************************************************* */

  void setCity(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _recomputePersonalBillingComplete() {
    final newValue =
        fNameController.text.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        streetAddressController.text.isNotEmpty &&
        areaController.text.isNotEmpty &&
        stateController.text.isNotEmpty;
    if (newValue != _isPersonalBillingComplete) {
      _isPersonalBillingComplete = newValue;
      notifyListeners();
    }
  }

  void refresh() {
    notifyListeners();
  }

  void invalidateAccountVerification() {
    try {
      final s = getIt.get<DojahService>();
      s.resetAccount();
    } catch (_) {}
    notifyListeners();
  }

  void setCountryCode(String code) {
    _countryCode = code;
    notifyListeners();
  }

  void increaseQuantity() {
    int current = int.tryParse(quantityController.text) ?? 1;
    quantityController.text = (current + 1).toString();
    notifyListeners();
  }

  void decreaseQuantity() {
    int current = int.tryParse(quantityController.text) ?? 1;
    if (current > 1) {
      quantityController.text = (current - 1).toString();
      notifyListeners();
    }
  }

  void setControllers(product_models.ProductsData product) {
    titleController.text = product.title ?? '';
    descriptionController.text = product.description ?? '';
    priceController.text = product.price.toString();
    locationController.text = product.shippingTo ?? '';
    quantityController.text = product.quantity.toString();
    _tags = product.tags ?? [];
    selectedSizeIds =
        product.sizes?.values
            .expand((list) => list.map((e) => e.id))
            .toList() ??
        [];
    selectedBrandModel = product.brand;
    selectedPriceRange = product.price;
    selectedShippingFromModel = product.shippingFrom;
    if (product.color != null && product.color!.isNotEmpty) {
      selectedColors.addAll(
        product.color!
            .split(', ')
            .map((color) => color.trim())
            .where((color) => color.isNotEmpty),
      );
    }
    selectedSubCategory = product.subCategory;
    if (product.condition != null) {
      selectedCondition = conditions.firstWhere(
        (c) => c.enumValue == product.condition,
      );
    }
    if (product.shippingTo != null) {
      selectedShippingToModel = shippingToList.firstWhere(
        (c) => c.title == product.shippingTo,
      );
    }

    selectedImages = [];
    notifyListeners();
  }

  void toggleColor(String colorName) {
    if (selectedColors.contains(colorName)) {
      selectedColors.remove(colorName);
    } else {
      selectedColors.add(colorName);
    }
    notifyListeners();
  }

  void toggleFilterCategory(String name) {
    final n = name.trim();
    if (n.isEmpty) return;
    if (selectedFilterCategories.contains(n)) {
      selectedFilterCategories.remove(n);
    } else {
      selectedFilterCategories.add(n);
    }
    notifyListeners();
  }

  @Deprecated('Use setSelectedCondition() for product conditions instead')
  void toggleFilterCondition(String title) {
    final t = title.trim();
    if (t.isEmpty) return;
    if (selectedFilterConditions.contains(t)) {
      selectedFilterConditions.remove(t);
    } else {
      selectedFilterConditions.add(t);
    }
    notifyListeners();
  }


  void onTagsChanged(List<String> newTags) {
    _tags = newTags;
  }

  void setSelectedSize(SizeOption size) {
    selectedSizeOption = size;
    notifyListeners();
  }

  void setSelectedBrand(BrandModel brand) {
    selectedBrandModel = brand;
    notifyListeners();
  }

  void setSelectedBrands(List<BrandModel> brands) {
    selectedBrands = brands;
    notifyListeners();
  }

  void setSelectedPriceRange(double priceRange) {
    selectedPriceRange = priceRange;
    notifyListeners();
  }

  void setSelectedShippingFrom(ShippingFromModel shippingFrom) {
    selectedShippingFromModel = shippingFrom;
    notifyListeners();
  }

  void setMainCategory(CategoryData value) {
    selectedMainCategory = value;
    clearSelectedSizes();
    selectedCategory = null;
    selectedBrandModel = null;
    notifyListeners();
  }

  void setCategory(CategoryData value) {
    selectedCategory = value;
    selectedSubCategory = null;
    clearSelectedSizes();
    notifyListeners();
  }

  void setSubCategory(CategoryData value) {
    selectedSubCategory = value;
    clearSelectedSizes();
    notifyListeners();
  }

  void setSelectedCondition(ConditionOptions conditionEnum) {
    selectedCondition = conditionEnum;
    notifyListeners();
  }

  void clearSelectedCondition() {
    selectedCondition = null;
    notifyListeners();
  }


  void setSelectedpayment(String payment) {
    selectedPayment = payment;
    notifyListeners();
  }

  void setCurrentPage(int index) {
    _currentPage = index;
    _currentLevel = index;
    notifyListeners();
  }

  void setMainCategoryList(List<CategoryData> mainCategories) {
    this.mainCategories = mainCategories;
    notifyListeners();
  }

  void setCategoryList(List<CategoryData> categories) {
    this.categories = categories;
    notifyListeners();
  }

  void setSubCategoryList(List<CategoryData> subCategories) {
    this.subCategories = subCategories;
    notifyListeners();
  }

  void setSelectedShippingTo(ShippingToOption shippingTo) {
    selectedShippingToModel = shippingTo;
    notifyListeners();
  }

  void setShippingToList(List<ShippingToOption> shipToList) {
    this.shipToList = shipToList;
    notifyListeners();
  }

  void setBrandList(List<BrandModel> brands) {
    this.brands = brands;
    notifyListeners();
  }

  void setShippingFromList(List<ShippingFromModel> shipFrom) {
    shipFromList = shipFrom;
    notifyListeners();
  }

  void goBack() {
    if (_currentLevel > 0) {
      _currentLevel--;
      notifyListeners();
    }
  }

  void reset() {
    _currentLevel = 0;
    notifyListeners();
  }

  void removeVideo() {
    _pickedVideo = null;
    _videoThumbnail = null;
    notifyListeners();
  }

  void clear() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    locationController.clear();
    quantityController.clear();
    quantityController.text = '1'; // Set default quantity to 1
    _tags = [];
    fNameController.clear();
    dateOfBirthController.clear();
    dobController.clear();
    phoneNumberController.clear();
    streetAddressController.clear();
    areaController.clear();
    stateController.clear();
  //  postalCodeController.clear();
    bankNameController.clear();
    accountNumberController.clear();
    ninController.clear();
    bvnController.clear();
    _pickedImage = null;
    _pickedVideo = null;
    _videoThumbnail = null;
    selectedImages = [];
    selectedSizeOption = null;
    selectedBrandModel = null;
    // _selectedColor = '';
    selectedCondition = null;
    selectedCategory = null;
    selectedSubCategory = null;
    selectedMainCategory = null;
    selectedShippingFromModel = null;
    selectedShippingToModel = null;
    selectedPriceRange = null;
    selectedColors.clear();
    selectedFilterCategories.clear();
    selectedFilterConditions.clear();
    _currentLevel = 0;
    // Clear KYC verification data
    _isKYCVerified = false;
    _verifiedBVN = null;
    _verifiedNIN = null;
    _kycVerificationData = null;
    notifyListeners();
  }

  ///***********************************Getters************************************************* */

  Future<void> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      // Check if adding these images would exceed the 4 image limit
      final totalImages = selectedImages.length + pickedFiles.length;
      if (totalImages > 4) {
        if (context.mounted) {
          MessageHelper.showErrorMessage(
            context,
            'You can only add up to 4 images. You currently have ${selectedImages.length} images and trying to add ${pickedFiles.length} more.',
          );
        }
        return;
      }

      // Process each picked image with cropping
      for (final pickedFile in pickedFiles) {
        final croppedFile = await _cropImage(pickedFile.path, context);
        if (croppedFile != null) {
          selectedImages.add(croppedFile.path);
        }
      }

      notifyListeners();
    }
  }

  Future<CroppedFile?> _cropImage(
    String imagePath,
    BuildContext context,
  ) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            backgroundColor: Colors.white,
            lockAspectRatio: false,
            hideBottomControls: false,
            showCropGrid: true,
            cropFrameColor: Colors.deepOrange,
            cropGridColor: Colors.deepOrange,
            cropGridStrokeWidth: 1,
            cropFrameStrokeWidth: 2,
            initAspectRatio: CropAspectRatioPreset.original,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
            rotateButtonsHidden: false,
            rotateClockwiseButtonHidden: false,
            aspectRatioPickerButtonHidden: false,
            resetAspectRatioEnabled: true,
            aspectRatioLockEnabled: false,
            minimumAspectRatio: 1.0,
            resetButtonHidden: false,
            doneButtonTitle: 'Done',
            cancelButtonTitle: 'Cancel',
          ),
        ],
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 90,
      );

      return croppedFile;
    } catch (e) {
      debugPrint('Image cropping failed: $e');
      // If cropping fails, return null so the image is not added
      return null;
    }
  }

  Future<void> cropSingleImage(BuildContext context, int imageIndex) async {
    if (imageIndex >= 0 && imageIndex < selectedImages.length) {
      final originalPath = selectedImages[imageIndex];
      final croppedFile = await _cropImage(originalPath, context);

      if (croppedFile != null) {
        selectedImages[imageIndex] = croppedFile.path;
        notifyListeners();
      }
    }
  }

  Future<void> pickVideoFromGallery(BuildContext context) async {
    final XFile? galleryVideo = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (galleryVideo != null) {
      // Check video file size (25MB = 25 * 1024 * 1024 bytes)
      final file = File(galleryVideo.path);
      final fileSize = await file.length();
      final maxSize = 25 * 1024 * 1024; // 25MB in bytes

      if (fileSize > maxSize) {
        if (context.mounted) {
          MessageHelper.showErrorMessage(
            context,
            'Video size must be less than 25MB. Selected video size: ${(fileSize / (1024 * 1024)).toStringAsFixed(2)}MB',
          );
        }
        return;
      }

      _pickedVideo = galleryVideo;
      generateThumbnail(galleryVideo.path);
      notifyListeners();
    }
  }

  Future<void> generateThumbnail(String videoPath) async {
    try {
      final dir = await getTemporaryDirectory();
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoPath,
        thumbnailPath: dir.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 200,
        quality: 75,
      );

      if (thumbnailPath != null) {
        _videoThumbnail = thumbnailPath;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Thumbnail generation failed: $e');
    }
  }

  RegisterSellerRequestModel _buildRegisterRequest() {
    final dobIso = _formatDobForBackend();
    return RegisterSellerRequestModel(
      fullName: fNameController.text.trim(),
      dateOfBirth: dobIso,
      phoneNumber: '${_countryCode}${phoneNumberController.text.trim()}',
      streetAddress: streetAddressController.text.trim(),
      //city: cityController.text.trim(),
      city: areaController.text.trim(),
      state: stateController.text.trim(),
    //  postalCode: postalCodeController.text.trim(),
      bankName: bankNameController.text.trim(),
      accountNumber: accountNumberController.text.trim(),
      bankVerificationNumber: _verifiedBVN ?? bvnController.text.trim(),
      nationalIdentityNumber: _verifiedNIN ?? ninController.text.trim(),
    );
  }

  String _formatDobForBackend() {
    if (dob != null) {
      final d = dob!;
      return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    }
    final raw = dateOfBirthController.text.trim();
    try {
      final parsed = DateTime.parse(raw);
      return '${parsed.year.toString().padLeft(4, '0')}-${parsed.month.toString().padLeft(2, '0')}-${parsed.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return raw;
    }
  }

  void updateBrandSearch(String query) {
    notifyListeners(); // This can be called from within the ViewModel
  }

  void clearBrandSearch() {
    brandSearchController.clear();
    notifyListeners();
  }

  Future<void> registerSeller(BuildContext context) async {
    if (!_validateRegistrationFields(context)) return;

    LoadingHelper.showLoading(context);
    try {
      final sellerData = _buildRegisterRequest();
      final result = await _repository.registerSeller(sellerData);
      if (result != null && result.success == true && context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          result.message ?? 'Registration successful',
        );
        final ProfileViewModel pv = getIt.get<ProfileViewModel>();
        pv.getUserProfile();
        clear();
        context.pushNamed(Routes.sellItem.name);
      } else {
        clear();
        throw Exception(result?.message ?? 'Failed to register seller');
      }
    } catch (e) {
      if (context.mounted) {
        // MessageHelper.showErrorMessage(context, e.toString());
        log("error registerSeller: $e");
      }
    } finally {
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
    }
  }

  bool _validateRegistrationFields(BuildContext context) {
    String err(String m) {
      if (context.mounted) MessageHelper.showErrorMessage(context, m);
      return m;
    }
    final name = fNameController.text.trim();
    final phone = phoneNumberController.text.trim();
    final address = streetAddressController.text.trim();
    final cityVal = areaController.text.trim();
    final stateVal = stateController.text.trim();
  //  final postal = postalCodeController.text.trim();
    final bank = bankNameController.text.trim();
    final acct = accountNumberController.text.trim();

    if (name.isEmpty) { err('Full name is required'); return false; }
    if (_formatDobForBackend().isEmpty) { err('Date of birth is required'); return false; }
    if (phone.isEmpty) { err('Phone number is required'); return false; }
    if (address.isEmpty || cityVal.isEmpty || stateVal.isEmpty) { err('Complete address is required'); return false; }
    if (bank.isEmpty || acct.isEmpty) { err('Bank and account number are required'); return false; }

    final dojah = getIt.get<DojahService>();
    final acctV = dojah.accountVerification;
    if (acctV == null) { err('Please verify your bank account before submitting'); return false; }

    String norm(String s) => s.trim().toLowerCase().replaceAll(RegExp(r"\s+"), ' ');
    final bankTitle = norm(acctV.accountName ?? '');
    final userFullNorm = norm(name);
    if (bankTitle.isEmpty || bankTitle != userFullNorm) {
      err('Bank account title must exactly match your full name');
      return false;
    }

    final hasBVN = (bvnController.text.trim().isNotEmpty) || (_verifiedBVN != null);
    final hasNIN = (ninController.text.trim().isNotEmpty) || (_verifiedNIN != null);
    if (!hasBVN && !hasNIN) { err('Please verify BVN or NIN'); return false; }

    return true;
  }

  Future<bool> submitProductForSale(
    BuildContext context, {
    required bool isDraft,
  }) async {
    LoadingHelper.showLoading(context);
    try {
      if (!isDraft && !_validateProductFields(context)) return false;
      final productData = _buildProductData(isDraft: isDraft);
      final result = await _repository.submitProductForSale(data: productData);
      LoadingHelper.hideLoading(context);
      if (!isDraft) {
        final homeViewModel = getIt.get<HomeViewModel>();
        homeViewModel.setIndex(0);
        // context.pop();
        Future.microtask(() {
          if (context.mounted) {
            showDialog(
              context: Navigator.of(context, rootNavigator: true).context,
              barrierDismissible: false,
              builder: (_) => Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(),
                child: OrderActionDialogBox(
                  onSubmitText: "See Product",
                  onCancelTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  onCancelText: '',
                  title: "Your Listing is posted and live",
                  subTitle: 'you can see your product in live',
                  isSuccess: true,
                  showButtons: false,
                  buttonText: '',
                  onSubmitTap: () {},
                ),
              ),
            );
          }
        });
      } else {
        final homeVm = getIt.get<HomeViewModel>();
        homeVm.setIndex(4);
      }
      MessageHelper.showSuccessMessage(context, result.message ?? "");
      clear();
    } catch (e) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
    }
    return true;
  }

  Future<bool> updateProduct({
    required BuildContext context,
    required String productId,
    required bool isDraft,
  }) async {
    LoadingHelper.showLoading(context);
    try {
      final productData = _buildProductData(isDraft: isDraft);
      final result = await _repository.updateSellerProduct(
        data: productData,
        id: productId,
      );
      MessageHelper.showSuccessMessage(context, result.message ?? "");
      clear();

      // Update existing product in both lists instead of refreshing
      final profileVm = getIt.get<ProfileViewModel>();
      // final homeVm = getIt.get<HomeViewModel>();

      if (!context.mounted) return false;

      // Update product in My Products list
      profileVm.updateProductInMyList(productId, productData);

      // Update product in For You list
      // homeVm.updateProductInLists(
      //   productId,
      //   _buildUpdatedProductFromData(productData, productId),
      // );
    } catch (e) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      setLoading(false);
    }
    return true;
  }

  Future<bool> getMainCategories(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getMainCategory();
      if (result.success == true) {
        setMainCategoryList(result.data!);
        return true;
      }
      return false;
    } catch (e) {
      // if (context.mounted) {
      //   MessageHelper.showErrorMessage(context, e.toString());
      // }
      log("error getMainCategories: $e");
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> getCategories(
    BuildContext context,
    String mainCategoryId,
  ) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getCategory(mainCategoryId);
      if (result.success == true) {
        setCategoryList(result.data!);
        return true;
      }
      return false;
    } catch (e) {
      // if (context.mounted) {
      //   MessageHelper.showErrorMessage(context, e.toString());
      // }
      log("error getSubCategories: $e");
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> getSubCategories(BuildContext context, String categoryId) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getSubCategories(categoryId);
      if (result.success == true) {
        setSubCategoryList(result.data!);
        return true;
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> getBrands(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getbrands();
      if (result.success == true) {
        setBrandList(result.data!);
        return true;
      }
      return false;
    } catch (e) {
      // if (context.mounted) {
      //   MessageHelper.showErrorMessage(context, e.toString());
      // }
      log("error getbrands: $e");
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> addNewBrand(BuildContext context, String brandName) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (brandName.isEmpty) {
        MessageHelper.showErrorMessage(context, 'Please enter a brand name');
        return false;
      }
      final result = await _repository.addNewBrand(brandName);
      if (result.success == true && context.mounted) {
        setBrandList([...brands, result.data!]);
        await getBrands(context);
        if (context.mounted) {
          MessageHelper.showSuccessMessage(context, 'Brand added successfully');
        }
        return true;
      } else {
        if (context.mounted) {
          MessageHelper.showErrorMessage(
            context,
            result.message ?? 'Failed to add brand',
          );
        }
        return false;
      }
    } catch (e) {
      // if (context.mounted) {
      //   MessageHelper.showErrorMessage(context, e.toString());
      // }
      log("error addNewBrand: $e");
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      addBrandController.clear();
      notifyListeners();
    }
  }

  Future<bool> getShipFrom(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getShipFrom();
      if (result.success == true) {
        setShippingFromList(result.data!);
        return true;
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> getShipTo(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.getShipTo();
      setShippingToList(result);
      return true;
    } catch (e) {
      //  if (context.mounted) {
      //   MessageHelper.showErrorMessage(context, e.toString());
      // }
      log("error getShipTo: $e");
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  ///***********************************Validators************************************************* */
  AddProductRequestModel _buildProductData({required bool isDraft}) {
    // Map selectedSizeIds to their values
    List<String> selectedSizeValues = [];
    groupedSizes.forEach((tab, sizes) {
      for (final s in sizes) {
        if (selectedSizeIds.contains(s.id)) {
          selectedSizeValues.add(s.value);
        }
      }
    });
    return AddProductRequestModel(
      photos: selectedImages,
      video: pickedVideo?.path ?? '',
      title: titleController.text,
      description: descriptionController.text,
      tags: _tags,
      price: double.tryParse(priceController.text) ?? 0.0,
      categoryId: selectedCategory?.id == '' && selectedSubCategory?.id != null
          ? null
          : selectedCategory?.id,
      subCategoryId: selectedSubCategory?.id == ''
          ? null
          : selectedSubCategory?.id,
      brandId: selectedBrandModel?.id ?? '',
      condition: selectedCondition?.enumValue ?? '',
      size: selectedSizeIds,
      shippingFromId: selectedShippingFromModel?.id ?? '',
      color: selectedColors.isNotEmpty ? selectedColors.join(', ') : "",
      quantity: int.tryParse(quantityController.text) ?? 1,
      shippingTo: selectedShippingToModel?.title ?? '',
      isDraft: isDraft,
    );
  }

  bool _validateProductFields(BuildContext context) {
    if (selectedImages.isEmpty) {
      MessageHelper.showErrorMessage(
        context,
        'Please select at least one photo',
      );
      return false;
    }
    if (titleController.text.trim().isEmpty) {
      MessageHelper.showErrorMessage(context, 'Please enter a title');
      return false;
    }
    if (descriptionController.text.trim().isEmpty) {
      MessageHelper.showErrorMessage(context, 'Please enter a description');
      return false;
    }
    if (priceController.text.trim().isEmpty ||
        int.tryParse(priceController.text) == null) {
      MessageHelper.showErrorMessage(context, 'Please enter a valid price');
      return false;
    }
    if (selectedCondition == null) {
      MessageHelper.showErrorMessage(
        context,
        'Please select product condition',
      );
      return false;
    }
    if (selectedBrandModel == null) {
      MessageHelper.showErrorMessage(context, 'Please select a brand');
      return false;
    }
    if (selectedColors.isEmpty) {
      MessageHelper.showErrorMessage(context, 'Please select a color');
      return false;
    }
    if (quantityController.text.trim().isEmpty ||
        int.tryParse(quantityController.text) == null) {
      MessageHelper.showErrorMessage(context, 'Please enter valid quantity');
      return false;
    }
    if (selectedShippingFromModel == null) {
      MessageHelper.showErrorMessage(context, 'Please select shipping details');
      return false;
    }
    return true;
  }

  String get categoryDisplayText {
    List<String> parts = [];
    if (selectedMainCategory != null) {
      parts.add(selectedMainCategory!.name!);
      if (selectedCategory != null) {
        parts.add(selectedCategory!.name!);
        if (selectedSubCategory != null) parts.add(selectedSubCategory!.name!);
      }
    }
    return parts.isEmpty ? 'Category' : parts.join(' > ');
  }

  /// Sync filters from ExploreViewModel
  void syncFromExploreFilters({
    String? size,
    List<String>? colors,
    List<String>? brandIds, // <-- new
    List<String>? brandNames, // <-- new
    List<String>? conditions,
    String? shippingFrom,
    String? price,
    List<BrandModel>? allBrands,
    List<ConditionOptions>? allConditions,
    List<ShippingFromModel>? allShippingFrom,
  }) {
    // Size ------------------------------------------------------------
    if (size != null && size.isNotEmpty && size.contains('-')) {
      final parts = size.split('-');
      if (parts.length == 2) {
        selectedSizeOption = SizeOption(category: parts[0], label: parts[1]);
      }
    } else {
      selectedSizeOption = null;
    }

    // Price ----------------------------------------------------------
    // (your existing logic here …)

    // Colors ---------------------------------------------------------
    selectedColors.clear();
    if (colors != null) {
      selectedColors.addAll(colors);
    }

    // Brands ---------------------------------------------------------
    selectedBrands.clear(); // <-- rename to plural
    if (brandIds != null && brandIds.isNotEmpty && allBrands != null) {
      for (var i = 0; i < brandIds.length; i++) {
        final id = brandIds[i];
        final name = (brandNames != null && brandNames.length > i)
            ? brandNames[i]
            : null;

        final match = allBrands.firstWhere(
          (b) => b.id == id,
          orElse: () => BrandModel(id: id, name: name),
        );
        selectedBrands.add(match);
      }
    } else {
      selectedBrands.clear();
    }

    // Conditions (Explore filters) ----------------------------------
    selectedFilterConditions.clear();
    if (conditions != null && conditions.isNotEmpty) {
      selectedFilterConditions.addAll(conditions);
    } else {
      selectedFilterConditions.clear();
    }

    // Shipping From --------------------------------------------------
    if (shippingFrom != null && allShippingFrom != null) {
      selectedShippingFromModel = allShippingFrom.firstWhere(
        (s) => s.name == shippingFrom,
        orElse: () => ShippingFromModel(name: shippingFrom),
      );
    } else {
      selectedShippingFromModel = null;
    }

    notifyListeners();
  }

  //  void syncFromExploreFilters({
  //     String? size,
  //     List<String>? colors,
  //     String? brandId,
  //     String? brandName,
  //     String? condition,
  //     String? shippingFrom,
  //     String? price,
  //     List<BrandModel>? allBrands,
  //     List<ConditionOptions>? allConditions,
  //     List<ShippingFromModel>? allShippingFrom,
  //   }) {
  //     // Size
  //     if (size != null && size.isNotEmpty && size.contains('-')) {
  //       final parts = size.split('-');
  //       if (parts.length == 2) {
  //         selectedSizeOption = SizeOption(category: parts[0], label: parts[1]);
  //       }
  //     } else {
  //       selectedSizeOption = null;
  //     }
  //     // Price

  //     // Colors
  //     selectedColors.clear();
  //     if (colors != null) {
  //       selectedColors.addAll(colors);
  //     }
  //     // Brand
  //     if (brandId != null && allBrands != null) {
  //       selectedBrandModel = allBrands.firstWhere(
  //         (b) => b.id == brandId,
  //         orElse: () => BrandModel(id: brandId, name: brandName),
  //       );
  //     } else {
  //       selectedBrandModel = null;
  //     }
  //     // Condition
  //     if (condition != null && allConditions != null) {
  //       selectedCondition = allConditions.firstWhere(
  //         (c) => c.title == condition,
  //         orElse: () => allConditions.first,
  //       );
  //     } else {
  //       selectedCondition = null;
  //     }
  //     // Shipping From
  //     if (shippingFrom != null && allShippingFrom != null) {
  //       selectedShippingFromModel = allShippingFrom.firstWhere(
  //         (s) => s.name == shippingFrom,
  //         orElse: () => ShippingFromModel(name: shippingFrom),
  //       );
  //     } else {
  //       selectedShippingFromModel = null;
  //     }
  //     notifyListeners();
  //   }

  Future<bool> fetchSizesForCategory(
    BuildContext context,
    String categoryId,
  ) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final response = await _repository.getSizesByCategory(categoryId);
      groupedSizes = response.data.sizes.map(
        (key, value) => MapEntry(
          key,
          value
              .map((e) => product_models.SizeValue(id: e.id, value: e.value))
              .toList(),
        ),
      );
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
      return true;
    } catch (e) {
      groupedSizes = {};
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
      return false;
    }
  }

  void toggleSelectedSize(String tab, String sizeId) {
    selectedSizeIds
      ..clear()
      ..add(sizeId);
    notifyListeners();
  }

  void clearSelectedSizes() {
    selectedSizeIds.clear();
    notifyListeners();
  }

  /// Helper method to convert AddProductRequestModel to ProductsData for updating lists
  // ProductsData _buildUpdatedProductFromData(
  //   AddProductRequestModel data,
  //   String productId,
  // ) {
  //   return ProductsData(
  //     id: productId,
  //     title: data.title,
  //     description: data.description,
  //     price: data.price,
  //     quantity: data.quantity,
  //     color: data.color,
  //     photos: data.photos,
  //     video: data.video,
  //     tags: data.tags,
  //     condition: data.condition,
  //     brandId: data.brandId,
  //     subCategoryId: data.subCategoryId,
  //     shippingFromId: data.shippingFromId,
  //     shippingTo: data.shippingTo,
  //     isDraft: data.isDraft,
  //   );
  // }
}

import 'package:flutter/widgets.dart';

import 'package:flutter/foundation.dart';
import 'package:qwic/core/services/product_details_service.dart/product_details_service.dart';
import 'package:qwic/core/models/product__details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  ProductDetailsProvider(this._productDetailService);
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final ProductDetailsService? _productDetailService;
  late ProductDetails? _productDetails = ProductDetails();
  ProductDetails? get productDetail => _productDetails;

  void setStateAndNotifyListener(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  Future<void> getProductDetails() async {
    setStateAndNotifyListener(true);
    _productDetails = await _productDetailService?.getProductDetails();
    setStateAndNotifyListener(false);
  }
}

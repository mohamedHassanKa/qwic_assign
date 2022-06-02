import 'package:flutter/widgets.dart';

import 'package:flutter/foundation.dart';
import 'package:qwic/core/services/product_details_service.dart/product_details_service.dart';
import 'package:qwic/core/models/product__details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final ProductDetailsService? _productDetailService = ProductDetailsService();
  late ProductDetails? _productDetails;
  ProductDetails? get productDetail => _productDetails;

  void setStateAndNotifyListener(bool status) {
    _isLoading = true;
  }

  Future<ProductDetails?> getProductDetails() async {
    _productDetails = await _productDetailService?.getProductDetails();

    return _productDetails;
  }
}

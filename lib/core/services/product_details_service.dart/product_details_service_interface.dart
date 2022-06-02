import 'package:qwic/core/models/product__details_model.dart';

abstract class ProductDetailsInterface {
  Future<ProductDetails?> getProductDetails();
}

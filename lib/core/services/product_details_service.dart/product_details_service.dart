import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:qwic/core/models/product__details_model.dart';
import './product_details_service_interface.dart';

import 'package:http/http.dart' as http;
import 'package:qwic/core/constants/app_constants.dart';

class ProductDetailsService implements ProductDetailsInterface {
  Future<ProductDetails?> getProductDetails() async {
    String url = '$baseUrl$productDetailUrl';
    Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.get(uri).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final dynamic decodedJson = jsonDecode(response.body);

        return ProductDetails.fromJson(decodedJson);
      } else {
        return ProductDetails();
      }
    } on Exception {
      throw Exception('an error to handled Occured');
    } catch (error) {
      print('throwing new error');
    }
  }
}

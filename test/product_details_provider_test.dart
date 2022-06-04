import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qwic/core/models/product__details_model.dart';
import 'package:qwic/core/providers/product_details_provider.dart';
import 'package:qwic/core/services/product_details_service.dart/product_details_service.dart';

class MockProductDetailsService extends Mock implements ProductDetailsService {}

void main() {
  late ProductDetailsProvider sut;
  late MockProductDetailsService mockProductDetailsService;

  setUpAll(() {
    mockProductDetailsService = MockProductDetailsService();
    sut = ProductDetailsProvider(mockProductDetailsService);
  });

  test('Test the initial Values of  the  provider', () {
    expect(sut.productDetail, ProductDetails());
    expect(sut.isLoading, false);
  });

  group('getProductDetails', () {
    ProductDetails articleDetail = ProductDetails(
        odo: 2001,
        frameNumber: "EFY111222",
        firmware: "1.2.1",
        warranty: 1.5,
        batteryCharge: 99.2,
        batteryType: "BA184751",
        batteryHealth: 99,
        batteryFirmware: "2.08",
        batteryWarranty: 1.5,
        motorType: "Bafang M420",
        motorSerialNumber: "BAFA8466578489",
        motorFirmware: "2.034",
        motorWarranty: 2);

    Future<void> initializeProductDetails() async {
      when(() => mockProductDetailsService.getProductDetails()).thenAnswer(
        (_) async => articleDetail,
      );
    }

    test('get product details using the service', () async {
      await initializeProductDetails();
      await sut.getProductDetails();
      verify(() => mockProductDetailsService.getProductDetails()).called(1);
    });

    test('get product details and update the state of the provider ', () async {
      initializeProductDetails();

      final future = sut.getProductDetails();

      expect(sut.isLoading, true);

      await future;

      expect(sut.isLoading, false);
      expect(sut.productDetail, articleDetail);
    });
  });
}

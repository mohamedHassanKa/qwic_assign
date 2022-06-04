import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwic/ui/shared/sub_title_descripition.dart';
import 'package:qwic/ui/shared/title_description.dart';
import 'package:qwic/core/models/product__details_model.dart';
import 'package:qwic/core/providers/product_details_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:qwic/ui/utils/colors.dart';
import 'package:qwic/ui/utils/helper_functions.dart' as helper;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ScrollController _controller = ScrollController();

  bool closeHeader = false;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        closeHeader = _controller.offset > 0 ? true : false;
      });
    });

    Future.microtask(
        () => context.read<ProductDetailsProvider>().getProductDetails());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /* final productDetailProvider = Provider.of<ProductDetailsProvider>(context); */

    const Duration duration = Duration(milliseconds: 600);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderContentDetails(
                size: size, duration: duration, closeHeader: closeHeader),
            Expanded(
              child: ListView(
                //physics: const BouncingScrollPhysics(),
                controller: _controller,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.40,
                      ),
                      SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.35,
                        child: SvgPicture.asset(
                          'assets/bike.svg',
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.12,
                            child: SvgPicture.asset(
                              'assets/arrow-down-icon.svg',
                              color: primaryColor.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: AnimatedSlide(
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 1000),
                          offset: closeHeader
                              ? const Offset(0, 30)
                              : const Offset(0, 0),
                          child: AnimatedOpacity(
                            duration: duration,
                            opacity: closeHeader ? 0 : 1,
                            child: Text('Ride',
                                style: TextStyle(
                                    fontSize: helper
                                        .getHeightResponsiveItemSize(34, size),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<ProductDetailsProvider>(
                      builder: (context, productDetailsConsumer, widget) {
                    if (productDetailsConsumer.isLoading) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else {
                      return ProductDescripition(
                        productDetails: productDetailsConsumer.productDetail,
                      );
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderContentDetails extends StatelessWidget {
  const HeaderContentDetails({
    Key? key,
    required this.size,
    required this.duration,
    required this.closeHeader,
  }) : super(key: key);

  final Size size;
  final Duration duration;
  final bool closeHeader;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      height: closeHeader ? 0 : size.height * 0.52,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: closeHeader ? 0 : size.height * 0.04,
            ),
            AnimatedOpacity(
              duration: duration,
              opacity: closeHeader ? 0 : 1,
              child: AnimatedScale(
                alignment: Alignment.topLeft,
                scale: closeHeader ? 0 : 1,
                duration: duration,
                child: SvgPicture.asset(
                  'assets/user-icon.svg',
                  height: 70,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: duration,
              opacity: closeHeader ? 0 : 1,
              child: AnimatedScale(
                scale: closeHeader ? 0 : 1,
                duration: duration,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: closeHeader ? 0 : size.height * 0.02),
                      child: Text(
                        'Good afternoon ,',
                        style: GoogleFonts.sansita(
                            fontSize:
                                helper.getHeightResponsiveItemSize(30, size),
                            letterSpacing: 1),
                      ),
                    ),
                    Text(
                      'Your bike is looking perfect to ride, watch out off the rain ',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: helper.getHeightResponsiveItemSize(20, size),
                        color: hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: closeHeader ? 0 : size.height * 0.05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedOpacity(
                duration: duration,
                opacity: closeHeader ? 0 : 1,
                child: AnimatedScale(
                  alignment: Alignment.topRight,
                  scale: closeHeader ? 0 : 1,
                  duration: duration,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: hintColor, width: 1)),
                    height: size.height * 0.17,
                    width: size.height * 0.17,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/update-icon.svg',
                          height: 100,
                        ),
                        Text(
                          'Updates',
                          style: TextStyle(
                            fontSize:
                                helper.getHeightResponsiveItemSize(20, size),
                            color: hintColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDescripition extends StatelessWidget {
  const ProductDescripition({Key? key, required this.productDetails})
      : super(key: key);
  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubTitleDescripition(
            title: 'ODO',
            descipition: '${productDetails?.odo.toString()} Km',
          ),
          SubTitleDescripition(
            title: 'Frame Number',
            descipition: productDetails?.frameNumber.toString(),
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails?.firmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails?.warranty.toString()} years',
          ),
          TitleDescripition(
            size: size,
            title: 'Battery',
          ),
          SubTitleDescripition(
            title: 'Charge',
            descipition: '${productDetails?.batteryCharge.toString()} %',
          ),
          SubTitleDescripition(
            title: 'Type',
            descipition: productDetails?.batteryType.toString(),
          ),
          SubTitleDescripition(
            title: 'Health',
            descipition: '${productDetails?.batteryHealth.toString()} %',
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails?.batteryFirmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails?.batteryWarranty.toString()} years',
          ),
          TitleDescripition(
            size: size,
            title: 'Motor',
          ),
          SubTitleDescripition(
            title: 'Type',
            descipition: productDetails?.motorType.toString(),
          ),
          SubTitleDescripition(
            title: 'Serial number',
            descipition: productDetails?.motorSerialNumber.toString(),
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails?.motorFirmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails?.motorWarranty.toString()} years',
          ),
        ],
      ),
    );
  }
}

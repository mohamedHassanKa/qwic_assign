import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qwic/core/models/product__details_model.dart';
import 'package:qwic/core/providers/product_details_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DetailsScreen(),
      ),
    );
  }
}

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
        closeHeader = _controller.offset > 20 ? true : false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productDetailProvider = Provider.of<ProductDetailsProvider>(context);
    const Duration duration = Duration(milliseconds: 600);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                children: [
                  HeaderContentDetails(
                      size: size, duration: duration, closeHeader: closeHeader),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.45,
                      ),
                      SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.35,
                        child: SvgPicture.asset(
                          'assets/bike.svg',
                        ),
                      ),
                      Positioned(
                        top: 40,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.12,
                            child: SvgPicture.asset(
                              'assets/arrow-down-icon.svg',
                              color: Colors.orange.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 50,
                        child: Text('Ride',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: productDetailProvider.getProductDetails(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ProductDescripition(
                          productDetails: snapshot.data,
                        );
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    },
                  )
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
      height: size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: closeHeader ? 0 : size.height * 0.04,
            ),
            AnimatedOpacity(
              duration: duration,
              opacity: closeHeader ? 0 : 1,
              child: AnimatedScale(
                scale: closeHeader ? 0 : 1,
                duration: duration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/user-icon.svg',
                      height: 70,
                    )
                  ],
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
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Text(
                        'Good afternoon ,',
                        style:
                            GoogleFonts.sansita(fontSize: 28, letterSpacing: 1),
                      ),
                    ),
                    const Text(
                      'Your bike is looking perfect to ride, watch out off the rain ',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: closeHeader ? 0 : size.height * 0.07,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedOpacity(
                duration: duration,
                opacity: closeHeader ? 0 : 1,
                child: AnimatedScale(
                  scale: closeHeader ? 0 : 1,
                  duration: duration,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    height: size.height * 0.17,
                    width: size.height * 0.17,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/update-icon.svg',
                          height: 100,
                        ),
                        const Text(
                          'Updates',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
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
  final ProductDetails productDetails;

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
            descipition: '${productDetails.odo.toString()} Km',
          ),
          SubTitleDescripition(
            title: 'Frame Number',
            descipition: productDetails.frameNumber.toString(),
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails.firmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails.warranty.toString()} years',
          ),
          TitleDescripition(
            size: size,
            title: 'Battery',
          ),
          SubTitleDescripition(
            title: 'Charge',
            descipition: '${productDetails.batteryCharge.toString()} %',
          ),
          SubTitleDescripition(
            title: 'Type',
            descipition: productDetails.batteryType.toString(),
          ),
          SubTitleDescripition(
            title: 'Health',
            descipition: '${productDetails.batteryHealth.toString()} %',
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails.batteryFirmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails.batteryWarranty.toString()} years',
          ),
          TitleDescripition(
            size: size,
            title: 'Motor',
          ),
          SubTitleDescripition(
            title: 'Type',
            descipition: productDetails.motorType.toString(),
          ),
          SubTitleDescripition(
            title: 'Serial number',
            descipition: productDetails.motorSerialNumber.toString(),
          ),
          SubTitleDescripition(
            title: 'Firmware',
            descipition: productDetails.motorFirmware.toString(),
          ),
          SubTitleDescripition(
            title: 'Warranty',
            descipition: '${productDetails.motorWarranty.toString()} years',
          ),
        ],
      ),
    );
  }
}

class SubTitleDescripition extends StatelessWidget {
  const SubTitleDescripition({
    Key? key,
    required this.title,
    required this.descipition,
  }) : super(key: key);
  final String title;
  final descipition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                descipition ?? 'N/A',
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

class TitleDescripition extends StatelessWidget {
  const TitleDescripition({Key? key, required this.size, required this.title})
      : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

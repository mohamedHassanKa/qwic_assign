import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailsScreen(),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
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
    const Duration duration = Duration(milliseconds: 800);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                children: [
                  HeaderContentDetails(
                      size: size, duration: duration, closeHeader: closeHeader),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.35,
                        child: SvgPicture.asset(
                          'assets/bike.svg',
                        ),
                      ),
                      Positioned(
                        top: 50,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.1,
                            child: SvgPicture.asset(
                              'assets/arrow-down-icon.svg',
                              color: Colors.orange.withOpacity(0.3),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.35,
                        child: SvgPicture.asset(
                          'assets/bike.svg',
                        ),
                      ),
                      Positioned(
                        top: 50,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.1,
                            child: SvgPicture.asset(
                              'assets/arrow-down-icon.svg',
                              color: Colors.orange.withOpacity(0.3),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.35,
                        child: SvgPicture.asset(
                          'assets/bike.svg',
                        ),
                      ),
                      Positioned(
                        top: 50,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.1,
                            child: SvgPicture.asset(
                              'assets/arrow-down-icon.svg',
                              color: Colors.orange.withOpacity(0.3),
                            ),
                          ),
                        ),
                      )
                    ],
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
      duration: const Duration(milliseconds: 800),
      padding:
          EdgeInsets.symmetric(horizontal: closeHeader ? 0 : size.width * 0.07),
      height: closeHeader ? 0 : size.height * 0.5,
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

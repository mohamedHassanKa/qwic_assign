import 'package:flutter/material.dart';
import 'package:qwic/ui/utils/colors.dart';
import 'package:qwic/ui/utils/helper_functions.dart' as helper;

/*
 this widget is used to render sub elements in the product details Screen
 */
class TitleDescripition extends StatelessWidget {
  const TitleDescripition({Key? key, required this.size, required this.title})
      : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: helper.getHeightResponsiveItemSize(22, size),
                fontWeight: FontWeight.bold),
          ),
          Divider(color: hintColor),
        ],
      ),
    );
  }
}

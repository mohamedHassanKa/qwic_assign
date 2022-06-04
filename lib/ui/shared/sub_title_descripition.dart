import 'package:flutter/material.dart';
import 'package:qwic/ui/utils/colors.dart';
import 'package:qwic/ui/utils/helper_functions.dart' as helper;

/*
 this widget is used to render Titles  with a spacer in the button in the product details Screen
 */
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
    final size = MediaQuery.of(context).size;
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
                descipition == 'null' ? 'N/A' : descipition,
                style: TextStyle(
                    fontSize: helper.getHeightResponsiveItemSize(20, size),
                    color: hintColor),
              ),
            ],
          ),
          Divider(color: hintColor),
        ],
      ),
    );
  }
}

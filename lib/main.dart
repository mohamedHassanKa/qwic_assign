import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qwic/core/providers/product_details_provider.dart';
import 'package:qwic/ui/screens/product_details_screen.dart';
import 'package:qwic/core/services/product_details_service.dart/product_details_service.dart';

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
        ChangeNotifierProvider(
          create: (_) => ProductDetailsProvider(ProductDetailsService()),
        )
      ],
      child: const MaterialApp(
        title: 'Qwic Assign',
        home: DetailsScreen(),
      ),
    );
  }
}

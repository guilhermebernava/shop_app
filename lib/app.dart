import 'package:flutter/material.dart';
import 'package:shop_app/themes/app_colors.dart';
import './screens/products_overview.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            AppThemeColor.color,
            AppThemeColor.colors,
          ),
        ).copyWith(
          secondary: AppColors.green,
        ),
        fontFamily: 'Anton',
      ),
      home: ProductsOverview(),
    );
  }
}

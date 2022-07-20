import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/providers/product_detail_provider.dart';
import 'package:shop_app/screens/cart/cart.dart';
import 'package:shop_app/screens/order_detail/order_detail.dart';
import 'package:shop_app/screens/orders/orders.dart';
import './providers/products_provider.dart';
import './screens/product_detail/product_detail.dart';
import './themes/app_colors.dart';
import 'screens/products_overview/products_overview.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //sempre que for criar uma INSTANCIA de uma classe para o PROVIDER
    //usar o metodo CREATE para evitar BUGS.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        )
      ],
      child: MaterialApp(
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
        home: const ProductsOverview(),
        routes: {
          ProductDetail.route: (context) => ChangeNotifierProvider.value(
                value: ProductDetailProvider(),
                child: const ProductDetail(),
              ),
          Cart.route: (context) => const Cart(),
          Orders.route: (context) => const Orders(),
          OrderDetail.route: (context) => const OrderDetail(),
        },
      ),
    );
  }
}

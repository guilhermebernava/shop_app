import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/providers/product_detail_provider.dart';
import 'package:shop_app/screens/cart/cart.dart';
import 'package:shop_app/screens/login/login.dart';
import 'package:shop_app/screens/order_detail/order_detail.dart';
import 'package:shop_app/screens/orders/orders.dart';
import 'package:shop_app/screens/product_edit/product_edit.dart';
import 'package:shop_app/screens/sign_up/sign_up.dart';
import 'package:shop_app/screens/user_products/user_products.dart';
import 'package:shop_app/services/internal_storage_services.dart';
import './providers/products_provider.dart';
import './screens/product_detail/product_detail.dart';
import './themes/app_colors.dart';
import 'models/auth_model.dart';
import 'screens/products_overview/products_overview.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //sempre que for criar uma INSTANCIA de uma classe para o PROVIDER
    //usar o metodo CREATE para evitar BUGS.
    return FutureBuilder(
      future: InternalStorageServices.loadInternalStorage(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => Auth(snapshot.data as AuthModel),
                ),
                ChangeNotifierProxyProvider<Auth, ProductsProvider>(
                  create: (_) => ProductsProvider(),
                  update: (_, auth, productProvider) =>
                      productProvider!..update(auth.token),
                ),
                ChangeNotifierProvider(
                  create: (_) => CartProvider(),
                ),
                ChangeNotifierProxyProvider<Auth, OrderProvider>(
                  create: (_) => OrderProvider(),
                  update: (_, auth, orderProvider) =>
                      orderProvider!..update(auth.token),
                ),
              ],
              child: Consumer<Auth>(
                builder: (context, auth, child) => MaterialApp(
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
                  initialRoute: auth.isAutenticated,
                  routes: {
                    '/': (context) => const ProductsOverview(),
                    ProductDetail.route: (context) =>
                        ChangeNotifierProvider.value(
                          value: ProductDetailProvider(),
                          child: const ProductDetail(),
                        ),
                    Cart.route: (context) => const Cart(),
                    Orders.route: (context) => const Orders(),
                    OrderDetail.route: (context) => const OrderDetail(),
                    UserProducts.route: (context) => const UserProducts(),
                    ProductEdit.route: (context) => const ProductEdit(),
                    Login.route: (context) => const Login(),
                    SingUp.route: (context) => const SingUp(),
                  },
                ),
              ),
            );
        }
        return const MaterialApp();
      },
    );
  }
}

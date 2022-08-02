import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/login/login.dart';
import 'package:shop_app/screens/orders/orders.dart';
import 'package:shop_app/screens/user_products/user_products.dart';
import 'package:shop_app/widgets/button_drawer.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello, how are you today?'),
            automaticallyImplyLeading: false,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ButtonDrawer(
                  context,
                  icon: Icons.shop,
                  text: 'Home',
                  onTap: () => Navigator.pushReplacementNamed(context, '/'),
                ),
                ButtonDrawer(
                  context,
                  icon: Icons.payment,
                  text: 'Orders',
                  onTap: () => Navigator.pushNamed(context, Orders.route),
                ),
                ButtonDrawer(
                  context,
                  icon: Icons.edit,
                  text: 'Yours Products',
                  onTap: () => Navigator.pushNamed(context, UserProducts.route),
                ),
                Consumer<Auth>(
                  builder: (context, value, child) => ButtonDrawer(
                    context,
                    icon: Icons.logout_outlined,
                    text: 'Logout',
                    onTap: () {
                      value.logout().then((value) {
                        Navigator.pushReplacementNamed(context, Login.route);
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

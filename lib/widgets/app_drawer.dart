import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders/orders.dart';
import 'package:shop_app/screens/user_products/user_products.dart';

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
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/'),
                  child: const ListTile(
                    leading: Icon(
                      Icons.shop,
                      size: 30,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Orders.route),
                  child: const ListTile(
                    leading: Icon(
                      Icons.payment,
                      size: 30,
                    ),
                    title: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 2),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, UserProducts.route),
                  child: const ListTile(
                    leading: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    title: Text(
                      'Yours Products',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

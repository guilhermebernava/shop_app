import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart.dart';

class ModalServices {
  static void goToCart(BuildContext context) {
    showDialog(
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Go to shopping cart?',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'This will redirect you to cart to make the order.',
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.popUntil(
                      context, (route) => route.settings.name == '/'),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'GO HOME',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(
                        context, (route) => route.settings.name == '/');
                    Navigator.pushNamed(context, Cart.route);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'ACCEPT',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      context: context,
    );
  }

  static void orderDone(BuildContext context) {
    showDialog(
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Your Order was created',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'You can see your orders in home screen',
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.popUntil(
                      context, (route) => route.settings.name == '/'),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      context: context,
    );
  }
}

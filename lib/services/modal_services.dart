import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart.dart';
import 'package:shop_app/themes/app_colors.dart';

import '../widgets/modal_buttons.dart';

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

  static Future<bool?> showModal(
      BuildContext context, String title, String content) {
    const modalSize = 300.0;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black87,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: modalSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const ModalButtons(
                    leftButtonName: 'CANCEL',
                    rightButtonName: 'ACCEPT',
                    modalSize: modalSize,
                  )
                ],
              ),
            ),
          );
        });
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

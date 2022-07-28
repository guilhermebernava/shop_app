import 'package:flutter/material.dart';
import 'package:shop_app/themes/app_colors.dart';

import '../widgets/modal_buttons.dart';

class ModalServices {
  static Future<bool?> showModal(
      BuildContext context, String title, String content, Size size) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black87,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: size.width * 0.3,
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
                  ModalButtons(
                    leftButtonName: 'CANCEL',
                    rightButtonName: 'ACCEPT',
                    modalSize: size.width * 0.3,
                  )
                ],
              ),
            ),
          );
        });
  }
}

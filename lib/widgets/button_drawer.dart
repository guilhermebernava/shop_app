import 'package:flutter/material.dart';

class ButtonDrawer extends Column {
  ButtonDrawer(
    BuildContext context, {
    Key? key,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) : super(key: key, children: [
          InkWell(
            onTap: onTap,
            child: ListTile(
              leading: Icon(
                icon,
                size: 30,
              ),
              title: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ]);
}

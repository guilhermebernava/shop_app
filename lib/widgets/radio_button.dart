import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class RadioButtonList extends CustomRadioButton {
  RadioButtonList({
    Key? key,
    required Size size,
    required void Function(dynamic) radioButtonValue,
    required List<String> buttonLabels,
    required List<dynamic> buttonValues,
  }) : super(
          key: key,
          padding: 5,
          elevation: 2,
          buttonLables: buttonLabels,
          width: size.width * 0.2,
          buttonValues: buttonValues,
          radioButtonValue: radioButtonValue,
          selectedBorderColor: Colors.transparent,
          unSelectedBorderColor: Colors.transparent,
          unSelectedColor: AppColors.white,
          selectedColor: AppColors.green,
        );
}

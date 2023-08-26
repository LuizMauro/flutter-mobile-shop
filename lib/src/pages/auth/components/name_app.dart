import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';

class NameApp extends StatelessWidget {
  final double fontSize;
  final Color colorTitle;

  const NameApp({
    super.key,
    required this.fontSize,
    required this.colorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: colorTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

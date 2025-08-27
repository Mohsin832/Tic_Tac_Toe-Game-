import 'package:flutter/material.dart';

class Uihelper {
  static customText({
    required String text,
    required double fontsize,
    required BuildContext context,
    String? fontfamily,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "Regular",
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.white,
      ),
    );
  }
}

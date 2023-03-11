import 'package:flutter/material.dart';
import '../product/color/project_color.dart';
import '../product/font/fonts.dart';
import '../product/util/constans.dart';

class SureText extends StatelessWidget {
  const SureText({
    super.key,
    required this.nextScreenText,
    required this.fontWeight,
    required this.letterSpacing,
    required this.fontSize,
  });

  final String nextScreenText;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectEdgeInsets().sureTextPaddig,
      child: Text(
        nextScreenText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ProjectColor().indicatorBG,
              fontFamily: Fonts().snicker,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              fontSize: fontSize,
            ),
      ),
    );
  }
}

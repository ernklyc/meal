import 'package:flutter/material.dart';
import '../product/color/project_color.dart';
import '../product/util/constans.dart';

class SplashScreenText extends StatelessWidget {
  const SplashScreenText({
    super.key,
    required this.splashScreenText,
    required this.fontFamily,
    required this.fontStyle,
  });

  final String splashScreenText;
  final String fontFamily;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          splashScreenText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: ProjectColor().ddddddColor,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            fontWeight: FontWeight.w900,
            letterSpacing: ProjectNum().letterSpacing,
            shadows: [
              Shadow(
                color: ProjectColor().black,
                blurRadius: ProjectNum().blurRadius,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../product/color/project_color.dart';
import '../product/font/fonts.dart';
import '../product/util/constans.dart';

class NextScreenHeadlineText extends StatelessWidget {
  const NextScreenHeadlineText({
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
      padding: ProjectEdgeInsets().horizontal20,
      child: Text(
        nextScreenText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ProjectColor().ddddddColor,
          fontFamily: Fonts().comicSansMS,
          fontStyle: FontStyle.italic,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          shadows: [
            Shadow(
              color: ProjectColor().black,
              blurRadius: ProjectNum().blurRadius,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}

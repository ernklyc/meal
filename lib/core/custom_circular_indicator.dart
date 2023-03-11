import 'package:flutter/material.dart';
import '../product/color/project_color.dart';
import '../product/lang/karma.dart';
import '../product/util/constans.dart';
import 'custom_text.dart';

class ProjectCircularProgressIndicator extends StatelessWidget {
  const ProjectCircularProgressIndicator({
    super.key,
    required this.mediaQueryWith,
  });

  final double mediaQueryWith;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColor().indicatorBG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(
              color: ProjectColor().ddddddColor,
              backgroundColor: ProjectColor().indicatorBG,
            ),
          ),
          SizedBox(height: mediaQueryWith / 10),
          NextScreenHeadlineText(
            nextScreenText: Karma().sabir,
            fontWeight: FontWeight.w800,
            letterSpacing: ProjectNum().zero,
            fontSize: ProjectNum().titleMedium,
          )
        ],
      ),
    );
  }
}
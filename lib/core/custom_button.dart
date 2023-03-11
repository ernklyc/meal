import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../product/color/project_color.dart';
import '../product/util/constans.dart';

class PrpjectElevatedButton extends StatelessWidget {
  const PrpjectElevatedButton({
    Key? key,
    required this.mediaQueryWith,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final double mediaQueryWith;
  final FaIcon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          ProjectColor().transparent,
        ),
        elevation: WidgetStateProperty.all(
          ProjectNum().zero,
        ),
        backgroundColor: WidgetStateProperty.all(
          ProjectColor().transparent,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: mediaQueryWith / 3.5,
        height: mediaQueryWith / 7.5,
        decoration: BoxDecoration(
          color: ProjectColor().ddddddColor,
          borderRadius: Decarations().circular25,
        ),
        child: icon,
      ),
    );
  }
}

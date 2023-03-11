import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../core/custom_circular_indicator.dart';
import '../core/splash_screen_text.dart';
import '../product/color/project_color.dart';
import '../product/font/fonts.dart';
import '../product/lang/splash_screen_text.dart';
import '../product/util/constans.dart';
import 'next_page_random_sure_ayet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final double mediaQueryWith = MediaQuery.of(context).size.width;
    final double mediaQueryHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Future tamamlandı, Text widget'ını gösteriyoruz
          return Center(
            child: AnimatedSplashScreen(
              splash: Stack(
                children: [
                  Image.asset(
                    SplashScreenImage().splashScreenImage[0],
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.low,
                    height: mediaQueryHeight,
                    width: mediaQueryWith,
                  ),
                  Container(
                    height: mediaQueryHeight,
                    color: ProjectColor().overlayColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: ProjectEdgeInsets().symetric50,
                        child: SizedBox(
                          height: mediaQueryWith,
                          width: mediaQueryWith,
                          child: Image.asset(
                            filterQuality: FilterQuality.low,
                            SplashScreenImage().splashScreenImage[1],
                          ),
                        ),
                      ),
                      SplashScreenText(
                        splashScreenText: SplasScreenText().sa,
                        fontFamily: Fonts().comicSansMS,
                        fontStyle: FontStyle.italic,
                      ),
                      height15(),
                      SplashScreenText(
                        splashScreenText: SplasScreenText().saArabic,
                        fontFamily: Fonts().readexProDeca,
                        fontStyle: FontStyle.normal,
                      ),
                    ],
                  ),
                ],
              ),
              centered: true,
              duration: 3000,
              splashIconSize: 1000,
              nextScreen: const NextPageRandomText(),
            ),
          );
        } else {
          return ProjectCircularProgressIndicator(
            mediaQueryWith: mediaQueryWith,
          );
        }
      },
    );
  }

  SizedBox height15() => const SizedBox(height: 15);
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meal/page/sure_secim_ekrani.dart';
import '../core/custom_button.dart';
import '../core/custom_circular_indicator.dart';
import '../core/custom_text.dart';
import '../product/color/project_color.dart';
import '../product/lang/next_page_image.dart';
import '../product/lang/sure_ayet_tefsir.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product/util/constans.dart';

class NextPageRandomText extends StatelessWidget {
  const NextPageRandomText({super.key});

  @override
  Widget build(BuildContext context) {
    SureAyet ayetler = SureAyet();
    Random random = Random();

    List<List<String>> allLists = [ayetler.fatiha];
    int randomListIndex = random.nextInt(allLists.length);
    List<String> randomList = allLists[randomListIndex];
    String randomElement = randomList[random.nextInt(randomList.length)];
    int randomElementIndex = randomList.indexOf(randomElement);
    String listName = String.fromCharCode(97 + randomListIndex);

    if (randomList.length > 1) {
      switch (listName) {
        case 'a':
          listName = 'Fatiha';
          break;
        case 'b':
          listName = 'Liste B';
          break;
        case 'c':
          listName = 'Liste C';
          break;
        case 'd':
          listName = 'Liste D';
          break;
        case 'e':
          listName = 'Liste E';
          break;
        case 'f':
          listName = 'Liste E';
          break;
        case 'g':
          listName = 'FATİHA';
          break;
        case 'h':
          listName = 'Liste B';
          break;
        case 'i':
          listName = 'Liste C';
          break;
        case 'j':
          listName = 'Liste D';
          break;
        case 'k':
          listName = 'Liste E';
          break;
        case 'l':
          listName = 'Liste E';
          break;

        default:
          break;
      }
    }

    final double mediaQueryWith = MediaQuery.of(context).size.width;
    final double mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ProjectColor().transparent,
      body: Stack(
        children: [
          Image.asset(
            NextPageImage().nextPageImage[RandomInt().rastgeleSayi],
            height: mediaQueryHeight,
            width: mediaQueryWith,
            fit: BoxFit.fill,
          ),
          Container(
            height: mediaQueryHeight,
            color: ProjectColor().overlayColor,
          ),
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 500)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NextScreenHeadlineText(
                        nextScreenText:
                            "$listName Suresi ${randomElementIndex + 1}.Ayet",
                        letterSpacing: ProjectNum().letterSpacing,
                        fontSize: ProjectNum().titleLarge,
                        fontWeight: FontWeight.w900,
                      ),
                      height100(),
                      NextScreenHeadlineText(
                        nextScreenText: '"$randomElement"',
                        fontSize: ProjectNum().titleMedium,
                        letterSpacing: ProjectNum().zero,
                        fontWeight: FontWeight.w400,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: mediaQueryWith / 6,
                          top: mediaQueryWith / 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrpjectElevatedButton(
                              mediaQueryWith: mediaQueryWith,
                              icon: FaIcon(
                                FontAwesomeIcons.bookQuran,
                                color: ProjectColor().indicatorBG,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SureSecim(),
                                  ),
                                );
                              },
                            ),
                            PrpjectElevatedButton(
                              mediaQueryWith: mediaQueryWith,
                              icon: FaIcon(
                                // ignore: deprecated_member_use
                                FontAwesomeIcons.refresh,
                                color: ProjectColor().indicatorBG,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NextPageRandomText(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ProjectCircularProgressIndicator(
                  mediaQueryWith: mediaQueryWith,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox height100() => const SizedBox(height: 100);
}

class RandomInt {
  int rastgeleSayi = Random().nextInt(NextPageImage().nextPageImage.length);
}

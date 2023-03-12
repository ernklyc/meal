import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/page/next_page_random_sure_ayet.dart';
import 'package:meal/product/lang/karma.dart';
import '../page/note_add.dart';
import '../product/color/project_color.dart';
import '../product/util/constans.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBottomNavBar extends StatefulWidget {
  const ProjectBottomNavBar({super.key});

  @override
  State<ProjectBottomNavBar> createState() => _ProjectBottomNavBarState();
}

class _ProjectBottomNavBarState extends State<ProjectBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectEdgeInsets().h60v30,
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColor().ddddddColor,
          borderRadius: Decarations().circular25,
        ),
        child: BottomNavigationBar(
          elevation: ProjectNum().zero,
          selectedFontSize: ProjectNum().zero,
          unselectedFontSize: ProjectNum().zero,
          backgroundColor: ProjectColor().transparent,
          selectedItemColor: ProjectColor().indicatorBG,
          unselectedItemColor: ProjectColor().indicatorBG,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const NextPageRandomText();
                    },
                  ));
                },
                child: const Icon(Icons.mosque),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AddNote(title: Karma().not);
                    },
                  ));
                },
                child: Icon(
                  Icons.edit_note_sharp,
                  size: ProjectNum().blurRadius * 6,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  sendEmail();
                },
                child: const Icon(Icons.report),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  //'klychub@gmail.com',

  void sendEmail() async {
    final Uri emailUri =
        Uri(scheme: 'mailto', path: Karma().mail, queryParameters: {
      'subject': Karma().subject,
      'body': Karma().body,
    });
    final String emailUrl = emailUri.toString();
    String fallbackUrl = Karma().web;

    try {
      // ignore: deprecated_member_use
      if (await canLaunch(emailUrl)) {
        // ignore: deprecated_member_use
        await launch(emailUrl);
      } else {
        throw 'E-posta uygulaması bulunamadı.';
      }
    } catch (e) {
      if (kDebugMode) {
        print('E-posta gönderme hatası: $e');
      }
      // ignore: deprecated_member_use
      await launch(
          fallbackUrl); // uygulama içinde bir e-posta gönderme sayfası açılır
    }
  }
}

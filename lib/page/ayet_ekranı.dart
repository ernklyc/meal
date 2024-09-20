// ignore_for_file: file_names
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:meal/page/profile.dart';
import '../core/bottom_nav_bar.dart';
import '../core/sure_text.dart';
import '../product/color/project_color.dart';
import '../product/lang/karma.dart';
import '../product/lang/next_page_image.dart';
import '../product/lang/sure_ayet_tefsir.dart';
import '../product/util/constans.dart';
import 'next_page_random_sure_ayet.dart';

class AyetOkumaEkrani extends StatefulWidget {
  final int pageIndex;

  const AyetOkumaEkrani({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<AyetOkumaEkrani> createState() => _AyetOkumaEkraniState();
}

class _AyetOkumaEkraniState extends State<AyetOkumaEkrani> {
  final TextEditingController _searchController = TextEditingController();

  void _filterSureBilgileri(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().indicatorBG,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            bottom: AppBar(
              elevation: ProjectNum().zero,
              automaticallyImplyLeading: false,
              backgroundColor: ProjectColor().indicatorBG,
              title: Padding(
                padding: ProjectEdgeInsets().textFieldButton,
                child: SizedBox(
                  height: ProjectNum().height45,
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: _filterSureBilgileri,
                    cursorColor: ProjectColor().indicatorBG,
                    style: TextStyle(
                      color: ProjectColor().indicatorBG,
                      fontSize: ProjectNum().titleMedium,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ProjectColor().ddddddColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: ProjectColor().indicatorBG,
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                        color: ProjectColor().indicatorBG,
                      ),
                      isDense: true,
                      filled: true,
                      hintText: Karma().textFieldText2,
                      fillColor: ProjectColor().ddddddColor,
                      contentPadding: ProjectEdgeInsets().horizontal20,
                      labelStyle: TextStyle(color: ProjectColor().indicatorBG),
                    ),
                  ),
                ),
              ),
            ),
            snap: true,
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text(Karma().bismillah),
            expandedHeight: ProjectNum().height120,
            backgroundColor: ProjectColor().indicatorBG,
            leading: const ArrowLeft(),
            actions: const [PersonButton()],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 1.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final sureText = "${index + 1}";

                  // Arama metni varsa ve aranılan metin bulunamazsa null döndürür
                  if (_searchController.text.isNotEmpty &&
                      !sureText
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase())) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    child: Row(
                      children: [
                        Padding(
                          padding: ProjectEdgeInsets().horizontal20,
                          child: Padding(
                            padding: ProjectEdgeInsets().vertical20,
                            child: FlipCard(
                              front: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ProjectColor().ddddddColor,
                                        borderRadius: Decarations().circular25,
                                      ),
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: SingleChildScrollView(
                                          child: SureText(
                                            nextScreenText:
                                                SureAyet().getListItem(
                                              widget.pageIndex,
                                              index,
                                            ),
                                            fontSize: ProjectNum().titleMedium,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: ProjectNum().zero,
                                            maxLines: 100,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: ProjectEdgeInsets().top20,
                                      child: Text(
                                        "${index + 1}. Ayet",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: ProjectColor().ddddddColor,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              back: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ProjectColor().ddddddColor,
                                ),
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Image.asset(
                                  NextPageImage()
                                      .nextPageImage[RandomInt().rastgeleSayi],
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              direction: FlipDirection.VERTICAL,
                              speed: 500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: SureAyet().itemCount(widget.pageIndex),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

class PersonButton extends StatelessWidget {
  const PersonButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const Profile();
          },
        ));
      },
      icon: Icon(
        Icons.person,
        size: ProjectNum().blurRadius * 6,
      ),
    );
  }
}

class ArrowLeft extends StatelessWidget {
  const ArrowLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_circle_left_rounded,
        size: ProjectNum().blurRadius * 6,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

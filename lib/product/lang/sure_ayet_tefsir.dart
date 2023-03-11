class SureAyet {
  List<String> fatiha = [
    "Rahmân ve rahîm olan Allah’ın adıyla...",
    "Hamd, âlemlerin Rabbi olan Allah’a mahsustur.",
    "Rahmân ve rahîm.",
    "Ödül ve ceza gününün tek hâkimi.",
    "(Rabbimiz!) Ancak sana kulluk eder ve yalnız senden yardım dileriz.",
    "Bizi dosdoğru yola ilet;",
    "Nimetine erdirdiklerinin yoluna; gazaba uğramışların yoluna da, dalâlete sapmışların yoluna da değil! Âmin!",
  ];

  List<String> deneme = [
    "deneme 1",
    "deneme 2",
    "deneme 3",
    "deneme 4",
    "deneme 5",
    "deneme 6",
    "deneme 7",
    "deneme 8",
  ];
  List<String> deneme2 = [
    "dedsfsdfneme 1",
    "denevcxc me 2",
    "de      neme 3",
    "den  eme 4",
    "deneme 5",
    "deneme 6",
    "deneme 7",
    "deneme 8",
    "deneme 9",
    "deneme 10",
  ];

  String getListItem(int pageIndex, int index) {
    if (pageIndex == 0) {
      pageIndex = 0;
      return fatiha[index];
    } else if (pageIndex == 1) {
      pageIndex = 1;
      return deneme[index];
    } else if (pageIndex == 2) {
      pageIndex = 2;
      return deneme2[index];
    } else {
      return "";
    }
  }

  int itemCount(int pageIndex) {
    if (pageIndex == 0) {
      return fatiha.length;
    } else if (pageIndex == 1) {
      return deneme.length;
    } else if (pageIndex == 2) {
      return deneme2.length;
    } else {
      return 0;
    }
  }
}

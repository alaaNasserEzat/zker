import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:zker/features/quran_feature/data/models/ayah_model.dart';
import 'package:zker/features/quran_feature/data/models/quran_page.dart';
import 'package:zker/features/quran_feature/data/models/surah.dart';
import 'package:zker/features/quran_feature/domain/reop/quran_repo.dart';
import 'package:zker/features/quran_feature/domain/use_case/get_quran_use_case.dart';



class QuranCubit extends Cubit<List<QuranPage>> {
    final GetQuranUseCase quranRepository;
  QuranCubit(this.
  quranRepository)
      :  super([]);



  List<QuranPage> staticPages = [];
  List<int> quranStops = [];
  List<int> surahsStart = [];
  List<Surah> surahs = [];
  final List<Ayah> ayahs = [];
  int lastPage = 1;
  int? initialPage;

  PageController _pageController = PageController();

  Future<void> loadQuran({quranPages = 604}) async {
    // lastPage = _quranRepository.getLastPage() ?? 1;
    // if (lastPage != 0) {
    //   _pageController = PageController(initialPage: lastPage - 1);
    // }
    if (staticPages.isEmpty || quranPages != staticPages.length) {
      staticPages = List.generate(quranPages,
          (index) => QuranPage(pageNumber: index + 1, ayahs: [], lines: []));
      final quranJson = await quranRepository.call();
      int hizb = 1;
      int surahsIndex = 1;
      List<Ayah> thisSurahAyahs = [];
      for (int i = 0; i < quranJson.length; i++) {
        final Ayah ayah = quranJson[i];
        if (ayah.surahNumber != surahsIndex) {// لو رقم الصوره اتغير 
          surahs.last.endPage = ayahs.last.page;
          surahs.last.ayahs = thisSurahAyahs;
          surahsIndex = ayah.surahNumber;
          thisSurahAyahs = [];
        }
        ayahs.add(ayah);
        thisSurahAyahs.add(ayah);
        staticPages[ayah.page - 1].ayahs.add(ayah);
        if (ayah.ayah.contains('۞')) {
          staticPages[ayah.page - 1].hizb = hizb++;
          quranStops.add(ayah.page);
        }
        if (ayah.ayah.contains('۩')) {
          staticPages[ayah.page - 1].hasSajda = true;
        }
        if (ayah.ayahNumber == 1) {
          ayah.ayah = ayah.ayah.replaceAll('۞', '');
          staticPages[ayah.page - 1].numberOfNewSurahs++;
          surahs.add(Surah(
              index: ayah.surahNumber,
              startPage: ayah.page,
              endPage: 0,
              nameEn: ayah.surahNameEn,
              nameAr: ayah.surahNameAr,
              ayahs: []));
          surahsStart.add(ayah.page - 1);
        }
      }
      surahs.last.endPage = ayahs.last.page;
      surahs.last.ayahs = thisSurahAyahs;
      for (QuranPage staticPage in staticPages) {
        List<Ayah> ayas = [];
        for (Ayah aya in staticPage.ayahs) {
          if (aya.ayahNumber == 1 && ayas.isNotEmpty) {
            ayas.clear();
          }
          if (aya.ayah.contains('\n')) {
            final lines = aya.ayah.split('\n');
            for (int i = 0; i < lines.length; i++) {
              bool centered = false;
              if ((aya.centered && i == lines.length - 2)) {
                centered = true;
              }
              final a = Ayah.fromAya(
                  ayah: aya,
                  aya: lines[i],
                  ayaText: lines[i],
                  centered: centered);
              ayas.add(a);
              if (i < lines.length - 1) {
                staticPage.lines.add(Line([...ayas]));
                ayas.clear();
              }
            }
          } else {
            ayas.add(aya);
          }
        }
        ayas.clear();
      }
      emit(staticPages);
    }
  }
  int currentPageIndex = 0;
void changePage(int index) {
  currentPageIndex = index;
  emit(List.from(state));
}
  List<Ayah> search(String searchText) {
    if (searchText.isEmpty) {
      return [];
    } else {
      final filteredAyahs = ayahs
          .where((aya) => aya.ayahText.contains(searchText.trim()))
          .toList();
      return filteredAyahs;
    }
  }

  // saveLastPage(int lastPage) {
  //   this.lastPage = lastPage;
  //   quranRepository.saveLastPage(lastPage);
  // }

  animateToPage(int page) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    } else {
      _pageController = PageController(initialPage: page);
    }
  }

  get pageController => _pageController;
}
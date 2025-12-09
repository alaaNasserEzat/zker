import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/quran_feature/data/local_data_source/quran_local_data_source.dart';
import 'package:zker/features/quran_feature/data/models/quran_page.dart';
import 'package:zker/features/quran_feature/data/repo_impl/quran_repo_imp.dart';
import 'package:zker/features/quran_feature/domain/use_case/get_quran_use_case.dart';
import 'package:zker/features/quran_feature/presentation/cubits/auran_cubit.dart';
import 'package:zker/features/quran_feature/presentation/views/widgets/bassmall_widget.dart';
import 'package:zker/features/quran_feature/presentation/views/widgets/quran_line.dart';
import 'package:zker/features/quran_feature/presentation/views/widgets/sura_header_widget.dart';


class QuranView extends StatefulWidget {
  const QuranView({super.key, required this.targetPage});
final  targetPage;

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
    late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.targetPage - 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return BlocProvider(
      create: (context) => QuranCubit(GetQuranUseCase(QuranRepoImp(quranLocalDataSource: QuranLocalDataSourceImpl())))..loadQuran(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
appBar: AppBar(
  centerTitle: true,
  backgroundColor: AppColors.mainColor,
  leading: IconButton(onPressed: (){
    context.pop();
  }, icon: Icon(  Icons.arrow_back_ios, color: AppColors.white,),),
  title: BlocBuilder<QuranCubit, List<QuranPage>>(
    builder: (context, pages) {
      if (pages.isEmpty) {
        return const Text('المصحف الشريف', style: AppTextStyles.zekerTitle);
      }

      // final cubit = context.read<QuranCubit>();
      // final currentPage = pages[cubit.currentPageIndex];

      // final surahName = currentPage.ayahs.first.surahNameAr;
      // final pageNumber = currentPage.pageNumber; // أو index + 1 حسب الموديل عندك

      return Row(
 mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    Text(
            'الصفحة ${widget.targetPage}  ',
            style: AppTextStyles.zekerTitle.copyWith(fontSize: 20),
          ),
          Text(
            "(${pages[widget.targetPage - 1].ayahs.first.surahNameAr})",
            style: AppTextStyles.zekerTitle.copyWith(fontSize: 20),
          ),

        ],
      );
    },
  ),
),

          body: BlocBuilder<QuranCubit, List<QuranPage>>(
            builder: (context, pages) {
              if (pages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
      
              return PageView.builder(
                itemCount: pages.length,
                controller: _pageController,
  onPageChanged: (index) {
    context.read<QuranCubit>().changePage(index);
  },

                itemBuilder: (context, index) {
                  final page = pages[index];
                  List<String> newSurahs = [];
      
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        // ✅ محتوى الصفحة
                        Expanded(
                          child: index == 0 || index == 1
                              ? _buildFirstTwoPages(page,context,index)
                              : _buildNormalPage(
                                  page,
                                  deviceSize,
                                  orientation,
                                  newSurahs,
                                ),
                        ),
      
                  
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // =========================
  Widget _buildFirstTwoPages(QuranPage page,context,int index) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SurahHeaderWidget(page.ayahs.first.surahNameAr),
            if(index==1)
            BasmallahWidget(page.ayahs.first.surahNumber),
            ...page.lines.map(
              (line) => Column(
                children: [
                  SizedBox(width:  MediaQuery.of(context).size.width - 32,),
                  QuranLine(
                    line,
                    boxFit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  Widget _buildNormalPage(
    QuranPage page,
    Size deviceSize,
    Orientation orientation,
    List<String> newSurahs,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          physics: orientation == Orientation.portrait
              ? const NeverScrollableScrollPhysics()
              : null,
          children: [
            ...page.lines.map((line) {
              bool firstAyah = false;

              if (line.ayahs.first.ayahNumber == 1 &&
                  !newSurahs.contains(line.ayahs.first.surahNameAr)) {
                newSurahs.add(line.ayahs.first.surahNameAr);
                firstAyah = true;
              }

              return Column(
                children: [
                  if (firstAyah)
                    SurahHeaderWidget(line.ayahs.first.surahNameAr),

                  if (firstAyah && line.ayahs.first.surahNumber != 9)
                    BasmallahWidget(line.ayahs.first.surahNumber),

                  SizedBox(
                    width: deviceSize.width - 30,
                    height: ((orientation == Orientation.portrait
                                ? constraints.maxHeight
                                : deviceSize.width) -
                            (page.numberOfNewSurahs *
                                (line.ayahs.first.surahNumber != 9
                                    ? 110
                                    : 80))) *
                        0.95 /
                        page.lines.length,
                    child: QuranLine(
                      line,
                      boxFit: line.ayahs.last.centered
                          ? BoxFit.scaleDown
                          : BoxFit.fill,
                    ),
                  ),
                ],
              );
            }),
          ],
        );
      },
    );
  }
}



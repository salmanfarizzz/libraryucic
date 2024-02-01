import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryucic/cubit/page_cubit.dart';
import 'package:libraryucic/ui/pages/catalogue_page.dart';
// import 'package:libraryucic/ui/pages/catalogue_page.dart';
import 'package:libraryucic/ui/pages/detail_pages.dart';
import 'package:libraryucic/ui/pages/history_page.dart';
import 'package:libraryucic/ui/pages/home_page.dart';
import 'package:libraryucic/ui/pages/profile_page.dart';
// import 'package:libraryucic/ui/pages/history_page.dart';
// import 'package:libraryucic/ui/pages/home_page.dart';
// import 'package:libraryucic/ui/pages/profile_page.dart';
import '../../shared/theme.dart';
import '../widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return CataloguePage();
        case 2:
          return HistoryPage();
        case 3:
          return ProfilePage1();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_catalogue.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_history.png',
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_profile.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}

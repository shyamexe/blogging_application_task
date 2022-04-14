import 'package:blogging_application/presentation/screens/article_screen/article_screen.dart';
import 'package:blogging_application/presentation/screens/home_widget_screen/home_widget_screen.dart';
import 'package:blogging_application/presentation/screens/menu_Screen/menu_screen.dart';
import 'package:blogging_application/presentation/screens/profile_screen/profile_screen.dart';
import 'package:blogging_application/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../logic/navigation_bar_cubit/navigation_bar_cubit.dart';

class CommonScreen extends StatelessWidget {
  final pageList = [
    HomeWigetScreen(),
    ArticleScreen(),
    ProfileScreen(),
    SearchScreen(),
    MenuScreen()
  ];
  //navigation screen wiget list
  //this widget usedfor home navigation

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: pageList[state.pageNumber],
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      icon: state.pageNumber == 0
                          ? SvgPicture.asset('assets/icons/home_svg.svg')
                          : SvgPicture.asset('assets/icons/home_svg.svg',
                              color: Colors.grey),
                      onPressed: () {
                        BlocProvider.of<NavigationBarCubit>(context)
                            .changeIndex(0);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/article_svg.svg',
                      ),
                      onPressed: () {
                        BlocProvider.of<NavigationBarCubit>(context)
                            .changeIndex(1);
                      },
                    ),
                  ),
                  Expanded(child: new Text('')),
                  Expanded(
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/search_svg.svg'),
                      onPressed: () {
                        BlocProvider.of<NavigationBarCubit>(context)
                            .changeIndex(3);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/menu_svg.svg'),
                      onPressed: () {
                        BlocProvider.of<NavigationBarCubit>(context)
                            .changeIndex(4);
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: InkWell(
              onTap: () {
                BlocProvider.of<NavigationBarCubit>(context).changeIndex(2);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Color(0xff376AED),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Color(0xff8FE6FF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}

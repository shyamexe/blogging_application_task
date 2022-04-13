import 'package:blogging_application/logic/cubit/navigation_bar_cubit.dart';
import 'package:blogging_application/presentation/screens/article_screen/article_screen.dart';
import 'package:blogging_application/presentation/screens/home_widget_screen/home_widget_screen.dart';
import 'package:blogging_application/presentation/screens/menu_Screen/menu_screen.dart';
import 'package:blogging_application/presentation/screens/profile_screen/profile_screen.dart';
import 'package:blogging_application/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CommonScreen extends StatelessWidget {
  final pageList = [
    HomeWigetScreen(),
    ArticleScreen(),
    ProfileScreen(),
    SearchScreen(),
    MenuScreen()
  ];

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
                      icon: state.pageNumber==0?
                        SvgPicture.asset('assets/icons/home_svg.svg')
                        :SvgPicture.asset('assets/icons/home_svg.svg',color: Colors.grey),
                      onPressed: () {
                        BlocProvider.of<NavigationBarCubit>(context)
                            .changeIndex(0);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon:SvgPicture.asset('assets/icons/article_svg.svg',),
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<NavigationBarCubit>(context).changeIndex(2);
              },
              tooltip: 'Increment',
              child: SvgPicture.asset('assets/icons/user_svg.svg'),
              elevation: 4.0,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}

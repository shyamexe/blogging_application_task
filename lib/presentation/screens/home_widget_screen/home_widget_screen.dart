import 'package:badges/badges.dart';
import 'package:blogging_application/core/constants/styles.dart';
import 'package:blogging_application/logic/scroll_data_cubit/scroll_data_cubit.dart';
import 'package:blogging_application/presentation/screens/home_widget_screen/widgets/article_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_tile.dart';
import 'widgets/news_tile.dart';
import 'widgets/status_icon.dart';

class HomeWigetScreen extends StatefulWidget {
  HomeWigetScreen({Key? key}) : super(key: key);

  @override
  State<HomeWigetScreen> createState() => _HomeWigetScreenState();
}

class _HomeWigetScreenState extends State<HomeWigetScreen> {
  ScrollController scrollController = ScrollController();

  final List adlist = [
    HomeTile(
      image: 'assets/images/image3.png',
      title: 'Technology',
    ),
    HomeTile(
      image: 'assets/images/image4.png',
      title: 'Adventure',
    ),
    HomeTile(
      image: 'assets/images/image3.png',
      title: 'Technology',
    ),
    HomeTile(
      image: 'assets/images/image4.png',
      title: 'Adventure',
    ),
  ];

  @override
  void initState() {
    scrollController.addListener(() {
      print(scrollController.offset);
      context.read<ScrollDataCubit>().updateScroll(scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF4F7FF),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Badge(
                  borderRadius: BorderRadius.circular(1),
                  position: BadgePosition(start: 1, top: 1),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              AppWIdget.sizeHeight10,
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Text(
                  'Hi, Jonathan!',
                  style: AppTextStyle.homeName,
                ),
              ),
              AppWIdget.sizeHeight10,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Explore today\'s',
                  style: AppTextStyle.homeTitle,
                ),
              ),
              AppWIdget.sizeHeight20,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 80,
                  width: size.width,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                      StatusIcon(),
                    ],
                  ),
                ),
              ),
              AppWIdget.sizeHeight20,
              SizedBox(
                height: 300,
                width: size.width,
                child: BlocBuilder<ScrollDataCubit, ScrollDataState>(
                  builder: (context, scrolstate) {
                    return ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: adlist.length,
                      itemBuilder: (context, index) {
                        if (scrolstate.index < 150) {
                          if (index == 0) {
                            return Padding(padding: EdgeInsets.only(left: 20),
                              child: adlist[0],);
                          } else {
                            return Transform.scale(
                              alignment: Alignment.topCenter,
                              scale: .8,
                              child: adlist[index],
                            );
                          }
                        } else if (150 < scrolstate.index &&
                            scrolstate.index < 360) {
                          if (index == 1) {
                            return adlist[1];
                          } else {
                            return Transform.scale(
                              scale: .8,
                              alignment: Alignment.topCenter,
                              child: adlist[index],
                            );
                          }
                        } else if (360 < scrolstate.index &&
                            scrolstate.index < 530) {
                          if (index == 2) {
                            return adlist[2];
                          } else {
                            return Transform.scale(
                              alignment: Alignment.topCenter,
                              scale: .8,
                              child: adlist[index],
                            );
                          }
                        } else {
                          if (index == 3) {
                            return Padding(padding: EdgeInsets.only(right: 30), child: adlist[3],
                            );
                          } else {
                            return Transform.scale(
                              alignment: Alignment.topCenter,
                              scale: .8,
                              child: adlist[index],
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ),
              AppWIdget.sizeHeight30,
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Latest News',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("More",
                          style: TextStyle(fontSize: 15, color: Colors.blue))
                    ],
                  )),
              AppWIdget.sizeHeight20,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ArticleView()));
                },
                child: NewsTile(),
              ),
              AppWIdget.sizeHeight10,
            ],
          ),
        ));
  }
}

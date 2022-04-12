import 'package:badges/badges.dart';
import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/home_tile.dart';
import 'widgets/news_tile.dart';
import 'widgets/status_icon.dart';

class HomeWigetScreen extends StatelessWidget {
  const HomeWigetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 300,
                  width: size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HomeTile(),
                      HomeTile(),
                      HomeTile(),
                      HomeTile(),
                      HomeTile(),
                      HomeTile(),
                    ],
                  ),
                ),
              ),
              AppWIdget.sizeHeight30,
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
              NewsTile(),
              AppWIdget.sizeHeight10,
              
            ],
          ),
        ));
  }
}

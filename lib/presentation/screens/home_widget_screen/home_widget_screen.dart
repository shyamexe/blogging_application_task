import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeWigetScreen extends StatelessWidget {
  const HomeWigetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge(
                borderRadius: BorderRadius.circular(1),
                position: BadgePosition(start: 1,top: 1),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}

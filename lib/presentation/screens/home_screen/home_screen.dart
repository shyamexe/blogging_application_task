import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonScreen extends StatelessWidget {
  CommonScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hi'),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home_rounded),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.menu_book_rounded),
                onPressed: () {},
              ),
            ),
            Expanded(child: new Text('')),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.person),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

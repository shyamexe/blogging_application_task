import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: 
            Text(
              'hi',
              style: Theme.of(context).textTheme.headline4,
           
      
      ),
    );
  }
}

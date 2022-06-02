import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator/flutter_tab_indicator.dart';
import 'package:flutter_tab_indicator_example/home_page.dart';
import 'package:flutter_tab_indicator_example/indicator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:HomePage(),
      ),
    );
  }
}

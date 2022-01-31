import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/flipicons.dart';

void main() {

  //Anroid Status Bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Color(0xFF746d99),
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFlipIcons()
    );
  }
}

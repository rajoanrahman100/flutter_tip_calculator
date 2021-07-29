import 'package:flutter/material.dart';
import 'package:fluttertipcalculator/themeCheckPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'components/themes.dart';
import 'homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Jobs',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );

    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );*/
  }
}



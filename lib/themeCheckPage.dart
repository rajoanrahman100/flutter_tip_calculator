import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),

      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Theme",style: Theme.of(context).textTheme.headline5!,),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 400,
              //width: 500,
              color: Theme.of(context).colorScheme.secondary,
            )
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.textTheme.bodyText1!.color,
        onPressed: () => Get.changeThemeMode(
          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
        ),
        child: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}

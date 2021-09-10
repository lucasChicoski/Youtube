import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube/utils/api.dart';
import 'package:youtube/utils/app_bar.dart';
import 'package:youtube/utils/bottom_navigation.dart';
import 'package:youtube/utils/screen_index.dart';
import 'controllers/bottom_navigation_controller.dart';

main() {
  instaces();
  runApp(MainApp());
}

var getIt = GetIt.I;

void instaces() {
  getIt.registerSingleton<BottomNavigationController>(
      BottomNavigationController());
  getIt.registerSingleton<ScreenIndex>(ScreenIndex());
  getIt.registerSingleton<API>(API());
}

class MainApp extends StatelessWidget {
  ScreenIndex screenIndex = GetIt.I<ScreenIndex>();
  BottomNavigationController bottomNavigationController =
      GetIt.I<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 55),
              child: AppBarApp(),
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              child: screenIndex.telas[bottomNavigationController.index],
            ),
            bottomNavigationBar: BottomNavigationApp()),
      );
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:youtube/screens/home.dart';
import 'package:youtube/screens/libraries.dart';
import 'package:youtube/screens/subscriptions.dart';
import 'package:youtube/screens/whatshot.dart';

class ScreenIndex {
  List<Widget> telas = [
    HomePage(),
    WhatShot(),
    Subscriptions(),
    Libraries(),
  ];
}

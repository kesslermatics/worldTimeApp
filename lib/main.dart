import 'package:flutter/material.dart';
import "package:project/pages/home.dart";
import "package:project/pages/loading.dart";
import "package:project/pages/choose_location.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => ChooseLocation(),
      },
    ),
  );
}

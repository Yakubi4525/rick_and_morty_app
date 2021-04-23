import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presntation/screen/main_screen.dart';
import 'package:rick_and_morty_app/presntation/style/theme.dart';

void main() {
    runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick anв Morty',
      theme: themeDark,
      home: MainScreen(),
    );
  }
}


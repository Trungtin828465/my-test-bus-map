import 'package:flutter/material.dart';
import 'screens/HomePage.dart';
import 'package:busmap/screens/welcome_screen.dart';
import 'package:busmap/theme/theme.dart';
import 'package:busmap/screens/MapGps.dart';
import 'package:busmap/screens/SelectRoute.dart';
import 'package:busmap/screens/MapGpsSearch.dart';
import 'package:busmap/screens/DetailBus.dart';
import 'package:busmap/mapdung.dart';

void main() {
  runApp(BusMapApp());
}

class BusMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mapDung(),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:busmap/screens/welcome_screen.dart';
// import 'package:busmap/theme/theme.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: lightMode,
//       home: const WelcomeScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'View/HomePage.dart';
//
// void main() {
//   runApp(BusMapApp());
// }
//
// class BusMapApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:busmap/screens/welcome_screen.dart';
import 'package:busmap/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}

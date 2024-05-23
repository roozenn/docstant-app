import 'package:flutter/material.dart';
// import 'package:healthcare/screens/pesan-doktor.dart';
import 'package:healthcare/screens/login.dart';
// import 'package:healthcare/widgets/navbar-roots.dart';

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
      home: loginScreen(),
    );
  }
}

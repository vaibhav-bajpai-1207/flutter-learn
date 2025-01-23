import 'package:flutter/material.dart';
import 'package:tutorial/screens/home_page.dart';
// import 'package:tutorial/screens/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 1, 141, 122)),
        // scaffoldBackgroundColor: const Color.fromARGB(255, 1, 141, 122),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

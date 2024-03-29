import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals_app/Screen/categoriesScreen.dart';
import 'package:meals_app/Screen/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 16, 15, 15),

  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
  debugShowCheckedModeBanner: false,
        // title: "MEALS App",
        home:const TabScreen() ,// Todo ...,
    );
  }
}
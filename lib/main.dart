import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("==> Design Challenge: Food Shop App (Flutter 3.7.1)");
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              displayLarge:
                  GoogleFonts.montserrat(fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
              displayMedium:
                  GoogleFonts.montserrat(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
              displaySmall: GoogleFonts.montserrat(fontSize: 49, fontWeight: FontWeight.w400),
              headlineMedium:
                  GoogleFonts.montserrat(fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
              headlineSmall: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
              titleLarge:
                  GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
              titleMedium:
                  GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
              titleSmall:
                  GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
              bodyLarge: GoogleFonts.questrial(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
              bodyMedium:
                  GoogleFonts.questrial(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
              labelLarge: GoogleFonts.questrial(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
              bodySmall: GoogleFonts.questrial(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
              labelSmall: GoogleFonts.questrial(fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
            )),
        home: const HomePage());
  }
}

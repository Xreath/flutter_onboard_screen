import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature/onboard/view/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF4F23FF),
          ),
          fontFamily: GoogleFonts.prompt().fontFamily,
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: Colors.black,
              )),
      home: const OnBoardView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

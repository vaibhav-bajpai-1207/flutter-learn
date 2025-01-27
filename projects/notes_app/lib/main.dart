import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:notes_app/pages/note_view_page/note_view_page.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_page.dart';
import 'package:notes_app/services/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const darkBlue = Color(0xFF031926);
  static const lightBlue = Color.fromARGB(255, 3, 38, 58);
  static const yellow = Color(0xFFF2CB40);
  static const orange = Color(0xFFEE9344);
  static const orangeBackground = Color.fromARGB(193, 255, 209, 169);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesListPage(),
      // home: NotesListPage(),
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: orange,
            backgroundColor: orangeBackground,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: lightBlue,
            titleTextStyle: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white
              // backgroundColor: darkBlue,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: darkBlue,
          textTheme: TextTheme(
            titleLarge: GoogleFonts.nunito(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            titleMedium: GoogleFonts.nunito(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            titleSmall: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            bodyLarge: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: Colors.white,
            ),
            bodyMedium: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            bodySmall: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            displayLarge: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            displayMedium: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
            displaySmall: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
          )),
    );
  }
}

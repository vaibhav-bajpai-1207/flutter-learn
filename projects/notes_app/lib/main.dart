import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/pages/note_view_page/note_view_page.dart';
// import 'package:notes_app/pages/notes_list_page/notes_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const darkBlue = Color(0xFF031926);
  static const yellow = Color(0xFFF2CB40);
  static const orange = Color(0xFFEE9344);
  static const orangeBackground = Color.fromARGB(255, 255, 228, 205);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteViewPage(),
      // home: NotesListPage(),
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: orange,
            backgroundColor: orangeBackground,
          ),
          appBarTheme: AppBarTheme(
            // backgroundColor: Colors.blue,
            titleTextStyle: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            actionsIconTheme: IconThemeData(
              color: darkBlue,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.nunito(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            titleMedium: GoogleFonts.nunito(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            titleSmall: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            bodyLarge: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: darkBlue,
            ),
            bodyMedium: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            bodySmall: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            displayLarge: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            displayMedium: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
            displaySmall: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: darkBlue,
            ),
          )),
    );
  }
}

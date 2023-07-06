import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/screens/board/board_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Test_task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.white,
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
            bodySmall: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            labelMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            )),
      ),
      home: const BoardScreen(),
    );
  }
}

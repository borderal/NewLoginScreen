import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webDemo/login.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        primaryColor: Color(0xFFFE4350),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LogIn(),
        LogIn.id: (context) => LogIn(),
      },
    );
  }
}

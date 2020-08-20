import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webDemo/csv_converter.dart';
import 'package:webDemo/login.dart';
import 'login.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.red),
              primaryColor: Colors.white,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Flutter Web',
            theme: theme,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => TableLayout(),
              LogIn.id: (context) => LogIn(),
            },
          );
        });
  }
}

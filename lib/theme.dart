import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'dark';

  toggleTheme() {
    currentTheme = currentTheme == 'light' ? 'dark' : 'light';
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarBrightness:
              currentTheme == 'light' ? Brightness.light : Brightness.dark),
    );
    notifyListeners();
  }
}

Color getColorForTheme(BuildContext context) {
  return context.read<ThemeProvider>().currentTheme == "light"
      ? Colors.black
      : Colors.white;
}

ThemeData getLightThemeData() {
  ThemeData lightTheme = ThemeData(
      primaryColor: Colors.white,
      colorScheme: ColorScheme.light(secondary: Colors.grey.shade300),
      iconTheme: const IconThemeData(color: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins');
  return lightTheme;
}

ThemeData getDarkThemeData() {
  ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
          secondary: Color(0xff394358),
          primaryVariant: Colors.lightGreenAccent),
      primarySwatch: Colors.lightGreen,
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),
      ),
      scaffoldBackgroundColor: const Color(0xff1e2638),
      fontFamily: 'Poppins');
  return darkTheme;
}

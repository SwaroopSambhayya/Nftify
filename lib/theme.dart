import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'dark';

  toggleTheme() {
    currentTheme = currentTheme == 'light' ? 'dark' : 'light';
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
      colorScheme: ColorScheme.light(secondary: Colors.grey.shade200),
      primarySwatch: Colors.lightGreen,
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

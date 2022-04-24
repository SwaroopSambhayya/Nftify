import 'package:flutter/material.dart';
import 'package:nftify/screens/home/view.dart';
import 'package:nftify/screens/onboarding/view.dart';
import 'package:nftify/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: getLightThemeData(),
      themeMode: context.watch<ThemeProvider>().currentTheme == 'dark'
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: getDarkThemeData(),
      home: const OnboardingScreen(),
      routes: {
        'OnBoarding': (context) => const OnboardingScreen(),
        'NftHome': (context) => const NftHome()
      },
    );
  }
}

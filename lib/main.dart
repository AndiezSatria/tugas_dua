import 'package:flutter/material.dart';
import 'package:tugas_dua/themes/styles.dart';
import 'package:tugas_dua/ui/pages/food_page.dart';
import 'package:tugas_dua/ui/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Dua',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primary50,
          unselectedItemColor: neutralGrey,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primary50,
              onPrimary: Colors.black,
            ),
      ),
      initialRoute: MainPage.routeName,
      routes: {
        MainPage.routeName: (context) => const MainPage(),
        FoodPage.routeName: (context) => const FoodPage(),
      },
    );
  }
}

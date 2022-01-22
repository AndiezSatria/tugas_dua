import 'package:flutter/material.dart';
import 'package:tugas_dua/ui/pages/home_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/";
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.refresh_rounded),
      label: "Recent",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 16.0,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        type: BottomNavigationBarType.fixed,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }
}

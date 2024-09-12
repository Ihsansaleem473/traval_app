import 'package:flutter/material.dart';
import 'package:traval_app/widgets/my_page.dart';
import 'package:traval_app/widgets/search_page.dart';

import 'widgets/bar_item_page.dart';
import 'widgets/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
     
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int currentIndex =0;
  void ontap(int index){
setState(() {
  currentIndex=index;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white ,
         onTap: ontap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                   icon: Icon(Icons.apps),label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),label: "Bar"),
            BottomNavigationBarItem(
                 icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(
                 icon: Icon(Icons.person),label: "profile"),
          ],
        ));
  }
}
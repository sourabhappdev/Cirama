import 'package:cinemava/Screens/Homepage_screen.dart';
import 'package:cinemava/Screens/Movies_screen.dart';
import 'package:cinemava/Screens/Search_screen.dart';
import 'package:cinemava/Screens/Tvshow_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controlpage extends StatefulWidget {
  const Controlpage({super.key});

  @override
  State<Controlpage> createState() => _ControlpageState();
}



class _ControlpageState extends State<Controlpage> {

  @override
  void initState() {
    super.initState();
    setvalue();
  }


  Future<void> setvalue() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("intro", true);

  }

  int _index = 0;

  final List<Widget> screens = [
    const Homepage(),
    const Movies(),
    const Tvshow(),
    const Searchscreen(),
  ];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _index == 0
          ? AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 30,
              title: const Text(
                "CIRAMA",
                style: TextStyle(
                  letterSpacing: 3,
                ),
              ),
              centerTitle: true,
            )
          : null,
      body: PageView.builder(
          itemCount: 4,
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              _index = page;
            });
          },
          itemBuilder: (context, position) {
            return Container(
              color: Colors.transparent,
              child: screens[position],
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 17),
          child: GNav(
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(icon: Icons.movie, text: 'Movies'),
              GButton(
                icon: Icons.tv,
                text: 'TV Shows',
              ),
              GButton(
                icon: Icons.search_outlined,
                text: 'Search',
              ),
            ],
            color: Colors.white,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            backgroundColor: Colors.black,
            gap: 15,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey,
            padding: const EdgeInsets.all(16),
            haptic: true,
            selectedIndex: _index,
            onTabChange: (page) {
              setState(() {
                _index = page;
              });
              pageController.jumpToPage(page);
            },
          ),
        ),
      ),
    );
  }
}

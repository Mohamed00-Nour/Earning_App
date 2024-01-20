import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Pages/Hot%20Now%20Page/hot_now_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Home Page/home_page.dart';
import 'ProfilePage/profile_page.dart';

class GNavPage extends StatefulWidget {
  const GNavPage({super.key, });

  static const String id = 'GNavPage';

  @override
  State<GNavPage> createState() => _GNavPageState();
}

class _GNavPageState extends State<GNavPage> {
  String email = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    email = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {});
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(email: email ),
      const HotNow(),
      const HotNow(),
       ProfilePage(email: email),
    ];
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: const Color(0xff27123a),
      bottomNavigationBar: Container(
        color: const Color(0xff1a0b28),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              duration: const Duration(milliseconds: 200),
              textStyle: optionStyle,
              color: Colors.white,
              haptic: false,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  borderRadius: BorderRadius.circular(15),
                  iconActiveColor: Colors.green,
                  textColor: Colors.green,
                  backgroundColor: const Color(0xff3e2b53),
                  gap: 8,
                  iconColor: Colors.white,
                  iconSize: 25,
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  borderRadius: BorderRadius.circular(15),
                  iconActiveColor: Colors.green,
                  backgroundColor: const Color(0xff3e2b53),
                  gap: 8,
                  iconColor: Colors.white,
                  iconSize: 25,
                  icon: Icons.local_fire_department_rounded,
                  text: 'Hot Now',
                  textColor: Colors.green,
                ),
                GButton(
                  borderRadius: BorderRadius.circular(15),
                  iconActiveColor: Colors.green,
                  backgroundColor: const Color(0xff3e2b53),
                  gap: 8,
                  iconColor: Colors.white,
                  iconSize: 25,
                  text: 'Search',
                  icon: Icons.search,
                  textColor: Colors.green,
                ),
                GButton(
                  borderRadius: BorderRadius.circular(15),
                  iconActiveColor: Colors.green,
                  backgroundColor: const Color(0xff3e2b53),
                  gap: 8,
                  iconColor: Colors.white,
                  iconSize: 25,
                  text: 'Profile',
                  icon: Icons.person,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

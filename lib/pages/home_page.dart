import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/coaching_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/stats_page.dart';
import 'package:flutter_application_1/pages/workout_page.dart';

List<Widget> pagesList = [
  const ProfilePage(),
  const WorkOutPage(),
  const StatsPage(),
  const CoachingPage(),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // const _MyHomePage({super.key});

  int _pageIndex = 1;

  var colorNav = Color.fromARGB(255, 223, 223, 223);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Smart Coach"),
      ),
      body: Center(
        child: pagesList[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_outlined),
            label: "Workout",
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats_outlined),
            label: "Sessions",
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: "Coaching",
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

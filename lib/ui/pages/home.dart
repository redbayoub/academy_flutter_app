import 'package:flutter/material.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/ui/views/explore/explore.dart';
import 'package:my_academy/ui/views/my_courses.dart';
import 'package:my_academy/ui/views/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    var appState = AppStateModel.of(context, true);

    if (!appState.authenticated) {
      return Scaffold(
        body: ExplorePage(),
      );
    }

    return Scaffold(
      body: _loadPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text("Explore")),
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text("My Courses")),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("Profile")),
      ],
      currentIndex: _selectedPage,
      onTap: (int newIndex) => setState(() {
        _selectedPage = newIndex;
      }),
    );
  }

  Widget _loadPage() {
    switch (_selectedPage) {
      case 0:
        return ExplorePage();
      case 1:
        return MyCoursesPage();
      case 2:
        return Profile();
    }
    return Text("Page Not found");
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../utils/user_simple_preferences.dart';
import 'exploreContainer.dart';
import 'homeContainer.dart';

class HomeScreen extends StatefulWidget {
  int? newContainerIndex = 1;

  HomeScreen({this.newContainerIndex});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController registrationController = Get.find();
  final int _homeContainerIndex = 1;
  late final PageController _pageController = PageController(
      initialPage: widget.newContainerIndex ?? _homeContainerIndex);
  String firstname = '';

  @override
  void initState() {
    super.initState();

    firstname = UserSimplePreferences.getFirstName();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14, right: 0, top: 8, bottom: 8),
          child: Image.asset(
            "assets/images/logos/eventslogo.png",
          ),
        ),
        title: const Text('Events.tech'),
        foregroundColor: Colors.orange[700],
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange, Colors.purple])),
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => widget.newContainerIndex = index);
            },
            children: <Widget>[
              exploreContainer(),
              HomeContainer(firstname: firstname),
              Container(),
            ],
          ),
        ),
      ),
      endDrawer: const homeDrawer(),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: widget.newContainerIndex ?? 1,
        onItemSelected: (index) {
          setState(() => widget.newContainerIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Explore'),
              icon: Icon(Icons.find_in_page),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange[800]!),
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange[800]!),
          BottomNavyBarItem(
              title: Text('My Tickets'),
              icon: Icon(Icons.calendar_view_day_sharp),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange[800]!),
        ],
      ),
    );
  }
}

class homeDrawer extends StatelessWidget {
  const homeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'Welcome Chris',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:events_app/screens/ticketsContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/events_controller.dart';
import '../utils/user_simple_preferences.dart';
import '../widgets/custom_drawer.dart';
import 'exploreContainer.dart';
import 'favoritesContainer.dart';

class HomeScreen extends StatefulWidget {
  int? newContainerIndex = 1;

  HomeScreen({this.newContainerIndex});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EventsController eventsController = Get.find();
  AuthController registrationController = Get.find();

  final int _homeContainerIndex = 1;
  late final PageController _pageController = PageController(
      initialPage: widget.newContainerIndex ?? _homeContainerIndex);

  String firstname = '';

  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching = false;
  String _searchText = "";

  Widget appBarTitle = Text(
    "Find Awesome Events",
    style: TextStyle(
      color: Colors.orange[700],
    ),
  );

  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.orange[700],
  );

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
      appBar: appBar(),
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
              FavoritesContainer(firstname: firstname),
              exploreContainer(),
              ticketsContainer(),
            ],
          ),
        ),
      ),
      drawer: homeDrawer(firstname: firstname),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: widget.newContainerIndex ?? 1,
        onItemSelected: (index) {
          setState(() => widget.newContainerIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Favourites'),
              icon: Icon(Icons.favorite_outlined),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange[800]!),
          BottomNavyBarItem(
              title: Text('Explore'),
              icon: Icon(Icons.find_in_page),
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

  AppBar appBar() {
    if (widget.newContainerIndex == null || widget.newContainerIndex == 1) {
      return AppBar(
          title: appBarTitle,
          iconTheme: IconThemeData(color: Colors.orange),
          foregroundColor: Colors.orange[700],
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = Icon(
                      Icons.close,
                      color: Colors.orange[700],
                    );
                    appBarTitle = TextField(
                      controller: _searchQuery,
                      style: TextStyle(
                        color: Colors.orange[700],
                      ),
                      onChanged: (value) =>
                          eventsController.filterEventsListByName(value),
                      decoration: InputDecoration(
                          hintText: "Search event..",
                          hintStyle: TextStyle(
                            color: Colors.orange[700],
                          )),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]);
    } else {
      return AppBar(
        title: const Text('Events.tech'),
        foregroundColor: Colors.orange[700],
        backgroundColor: Colors.white,
      );
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = Icon(
        Icons.search,
        color: Colors.orange[700],
      );
      appBarTitle = Text(
        "Find Awesome Events",
        style: TextStyle(
          color: Colors.orange[700],
        ),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

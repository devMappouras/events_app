import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/login.dart';
import '../utils/user_simple_preferences.dart';

class homeDrawer extends StatelessWidget {
  final String firstname;

  const homeDrawer({
    super.key,
    required this.firstname,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'Welcome $firstname,',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              // Update the state of the app
              // Then close the drawer
              await UserSimplePreferences.setToken('');
              await UserSimplePreferences.setCustomerId(0);
              await UserSimplePreferences.setFirstName('');
              await UserSimplePreferences.setEmail('');
              await UserSimplePreferences.setCountryId(0);

              Navigator.pop(context);

              Get.to(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}

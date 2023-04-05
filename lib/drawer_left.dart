import 'package:flutter/material.dart';
import 'package:flutter_app_project/auth_controller.dart';

class app_drawer extends StatelessWidget {
  final authcontroller = Authcontroller();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 159, 206, 89),
      child: ListView(children: [
        const UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 190, 225, 133)),
            accountName: Text(
              "Karuna",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 112, 29)),
            ),
            accountEmail: Text(
              "karunarandive9@gmail.com",
              style: TextStyle(
                  fontSize: 15.0, color: Color.fromARGB(255, 3, 112, 29)),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/girlprofile.jpg'),
            )),
        ListTile(
          iconColor: Color.fromARGB(255, 3, 112, 29),
          leading: Icon(
            Icons.home,
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 112, 29),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          iconColor: Color.fromARGB(255, 3, 112, 29),
          leading: Icon(
            Icons.help,
          ),
          title: Text(
            'Help Section',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 112, 29),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          iconColor: Color.fromARGB(255, 3, 112, 29),
          leading: Icon(
            Icons.star,
          ),
          title: Text(
            'Feedback',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 112, 29),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          iconColor: Color.fromARGB(255, 3, 112, 29),
          leading: Icon(
            Icons.logout,
          ),
          title: Text(
            'Log out',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 112, 29),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Authcontroller.logout();
          },
        )
      ]),
    );
  }
}

import 'package:carcompany/auth/auth_service.dart';
import 'package:carcompany/pages/Booking_pages.dart';
import 'package:carcompany/pages/cars.dart';
import 'package:carcompany/pages/homepages.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // home list tile
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepages()),
                );
              },
            ),
          ),
          ListTile(
            title: Text("Cars ", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cars()),
              );
            },
          ),
          ListTile(
            title: Text(
              "My Bookings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingPages()),
              );
            },
          ),
          ListTile(
            title: Text(
              "List Cars",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: Center(
                child: Text("Logout", style: TextStyle(color: Colors.white)),
              ),
            ),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}

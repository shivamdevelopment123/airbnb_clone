import 'package:airbnb/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/messages/messages_screen.dart';
import '../screens/trips/trips_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    WishlistScreen(),
    TripsScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.red[700],
          selectedFontSize: 10,
          backgroundColor: Colors.white,
          elevation: 6,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/search.png',
                height: 23,
                color: Colors.grey[600], // unselected color
              ),
              activeIcon: Image.asset(
                'assets/images/search.png',
                height: 23,
                color: Colors.red[700], // selected color
              ),
              label: "Explore",
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/heart.png',
                height: 23,
                color: Colors.grey[600], // unselected color
              ),
              activeIcon: Image.asset(
                'assets/images/heart.png',
                height: 23,
                color: Colors.red[700], // selected color
              ),
              label: "Wishlist",
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/airbnb.png',
                height: 23,
                color: Colors.grey[600],
              ),
              activeIcon: Image.asset(
                'assets/images/airbnb.png',
                height: 23,
                color: Colors.red[700],
              ),
              label: "Trips",
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/messages.png',
                height: 23,
                color: Colors.grey[600],
              ),
              activeIcon: Image.asset(
                'assets/images/messages.png',
                height: 23,
                color: Colors.red[700],
              ),
              label: "Messages",
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/circleuser.png',
                height: 23,
                color: Colors.grey[600],
              ),
              activeIcon: Image.asset(
                'assets/images/circleuser.png',
                height: 23,
                color: Colors.red[700],
              ),
              label: "Trips",
            ),
      ])
    );
  }
}

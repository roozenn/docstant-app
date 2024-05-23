import 'package:flutter/material.dart';
import 'package:healthcare/screens/home-screen.dart';
import 'package:healthcare/screens/riwayat.dart';
import 'package:healthcare/screens/pengobatan.dart';
import 'package:healthcare/screens/pengaturan.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    PengobatanScreen(),
    RiwayatScreen(),
    PengaturanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .local_hospital), // Menggunakan ikon rumah sakit untuk tema pengobatan
              label: "Pengobatan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Riwayat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), // Mengubah icon menjadi pengaturan
              label: "Pengaturan",
            ),
          ],
        ),
      ),
    );
  }
}

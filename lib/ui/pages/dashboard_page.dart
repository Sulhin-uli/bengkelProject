import 'package:flutter/material.dart';
import 'package:projek_bengkel/ui/pages/account/account_page.dart';
import 'package:projek_bengkel/ui/pages/denah_page.dart';
import 'package:projek_bengkel/ui/pages/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DenahPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Teknisi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking_outlined),
            label: 'Denah Bengkel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ui/poli_page.dart';
import 'ui/pegawai_page.dart';
import 'ui/pasien_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      home: const HomeTab(),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PoliPage(),
    PegawaiPage(),
    PasienPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: "Poli"),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: "Pegawai"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Pasien"),
        ],
      ),
    );
  }
}
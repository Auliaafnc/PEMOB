import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class BasePage extends StatelessWidget {
  final Widget bodyContent;
  final int selectedIndex;
  final HomeController _controller;

  const BasePage({
    Key? key,
    required this.bodyContent,
    required this.selectedIndex,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemrograman Mobile',
          style: TextStyle(color: Colors.white), // Ubah warna teks di sini
        ),
        backgroundColor: Colors.brown, // Warna latar belakang AppBar
      ),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Tracking'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information), label: 'Information'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.brown[100],
        unselectedItemColor: Colors.white, // Warna item yang tidak dipilih
        backgroundColor: Colors.brown, // Warna latar belakang BottomNavigationBar
        onTap: _controller.onBottomNavTapped,
      ),
    );
  }
}

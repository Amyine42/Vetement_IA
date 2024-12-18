import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Liste des pages/vues à afficher
  final List<Widget> _pages = [
    // Page Acheter (Home)
    const Center(child: Text('Page Acheter')),
    // Page Panier
    const Center(child: Text('Page Panier')),
    // Page Profil
    const ProfilePage(),
  ];

  // Titre dynamique selon la page sélectionnée
  PreferredSizeWidget? _buildAppBar() {
    if (_selectedIndex == 2) {
      // Pas d'AppBar pour la page profil car elle a son propre AppBar
      return null;
    }
    return AppBar(
      title: Text(_selectedIndex == 0 ? 'Home Page' : 'Panier'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
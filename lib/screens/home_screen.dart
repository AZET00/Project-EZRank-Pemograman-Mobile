import 'package:EZRank/screens/profile_screen.dart';
import 'package:EZRank/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'books_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenis Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: GameSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [
                    Color(0xFFff0000), // Merah
                    Color(0xFF00ff00), // Hijau
                    Color(0xFF0000ff), // Biru
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/PPPP.png',
                    ),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'EZRank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Your ultimate gaming companion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile( // Tambahkan opsi menu Settings
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()),
                );
              },
            ),
            ListTile( // Tambahkan tombol "Get Data"
              leading: const Icon(
                Icons.api,
                color: Colors.black,
              ),
              title: const Text(
                'Latihan API',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/news-screen');
              },
            ),
            ListTile( // Add button to access BooksScreen
              leading: const Icon(
                Icons.book,
                color: Colors.black,
              ),
              title: const Text(
                'Books',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BooksScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: games.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // Adjust this ratio as needed
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchURL(games[index].url);
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        games[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        games[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Game {
  final String name;
  final String imagePath;
  final String url;

  Game(this.name, this.imagePath, this.url);
}

final List<Game> games = [
  Game('Mobile Legend', 'assets/images/icon1_ML.png', 'https://wa.me/6287860120233?text=Silakan%20lengkapi%20data%20berikut%0Axxxxxxxxxxxxxxxxxxxxxxxx'),
  Game('PUBG Mobile', 'assets/images/icon2_PUBG.png', 'https://wa.me/6287860120233?text=Silakan%20lengkapi%20data%20berikut%0Axxxxxxxxxxxxxxxxxxxxxxxx'),
  Game('Free-Fire', 'assets/images/ff.png', 'https://wa.me/6287860120233?text=Silakan%20lengkapi%20data%20berikut%0Axxxxxxxxxxxxxxxxxxxxxxxx'),
  Game('PUBG Mobile New State', 'assets/images/newsate.png', 'https://wa.me/6287860120233?text=Silakan%20lengkapi%20data%20berikut%0Axxxxxxxxxxxxxxxxxxxxxxxx'),
];

class GameSearchDelegate extends SearchDelegate<Game> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Game('', '', ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Game> results = games.where((game) => game.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildGameGrid(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Game> suggestions = games.where((game) => game.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildGameGrid(suggestions);
  }

  Widget _buildGameGrid(List<Game> games) {
    return GridView.builder(
      itemCount: games.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8, // Adjust this ratio as needed
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            close(context, games[index]);
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      games[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      games[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

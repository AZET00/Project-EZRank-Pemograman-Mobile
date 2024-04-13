import 'package:EZRank/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:EZRank/screens/login_screen.dart';
import 'package:EZRank/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isLoggedIn ? const MyHomePage(title: 'Home') : const LoginScreen(), // Menggunakan LoginScreen jika belum login
      routes: {
        '/news-screen': (context) => const NewsScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: HomeScreen(), // Menggunakan HomeScreen sebagai body
    );
  }
}

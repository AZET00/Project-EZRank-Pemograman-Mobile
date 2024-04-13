import 'package:flutter/material.dart';
import 'package:EZRank/screens/home_screen.dart'; // Import file home_screen.dart
import 'package:EZRank/screens/register_screen.dart'; // Import file register_screen.dart

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email or Phone Number',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika autentikasi di sini
                  // Contoh sederhana: jika username dan password sama dengan 'admin', arahkan ke halaman home
                  if (_usernameController.text == 'pramanaaditya578@gmail.com' && _passwordController.text == 'Aditya2004') {
                    // Set isLoggedIn ke true dan refresh halaman
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  } else {
                    // Jika autentikasi gagal, tampilkan pesan kesalahan atau tindakan yang sesuai
                    // Di sini kita hanya mencetak pesan kesalahan ke konsol
                    print('Login failed: Incorrect username or password');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Warna tombol hijau
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text("I don't have an account"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

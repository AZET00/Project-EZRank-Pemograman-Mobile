import 'package:flutter/material.dart';
import 'package:EZRank/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _ktpIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('KTP ID', Icons.credit_card, _ktpIdController),
            const SizedBox(height: 20),
            _buildTextField('Enter Email', Icons.email, _emailController),
            const SizedBox(height: 20),
            _buildTextField('Enter Phone Number', Icons.phone, _phoneNumberController),
            const SizedBox(height: 20),
            _buildTextField('Enter Password', Icons.lock, _passwordController, isPassword: true),
            const SizedBox(height: 20),
            _buildTextField('Re-try Password', Icons.lock, _confirmPasswordController, isPassword: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your registration logic here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        hintText: 'Enter $label',
      ),
    );
  }

  @override
  void dispose() {
    _ktpIdController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

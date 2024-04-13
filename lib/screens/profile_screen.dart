import 'package:flutter/material.dart';
import 'package:EZRank/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'ADIT GANTENG');
  final TextEditingController _emailController = TextEditingController(text: 'Axxxxxxxxxx@xxxxx.xxx');
  final TextEditingController _phoneNumberController = TextEditingController(text: '+62xxxxxxxxxxx');
  final TextEditingController _ktpIdController = TextEditingController(text: '51xxxxxxxxxxxxxx');

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/icon_adit.png'),
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileField('Name', _nameController),
            _buildProfileField('Email', _emailController),
            _buildProfileField('Phone Number', _phoneNumberController),
            _buildProfileField('KTP ID', _ktpIdController),
            const SizedBox(height: 20),
            if (_isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Simpan perubahan data profil di sini
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  child: const Text('Save Changes'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            enabled: _isEditing,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter $label',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _ktpIdController.dispose();
    super.dispose();
  }
}
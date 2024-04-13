import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkModeEnabled = value;
    });
  }

  void _changeLanguage(String? newValue) {
    setState(() {
      _selectedLanguage = newValue ?? 'English';
    });
  }

  void _saveSettings() {
    // Add logic to save settings
    // For demonstration purposes, print the selected values
    print('Notifications Enabled: $_notificationsEnabled');
    print('Dark Mode Enabled: $_darkModeEnabled');
    print('Selected Language: $_selectedLanguage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        children: [
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
          ),
          ListTile(
            title: const Text('Automatic update'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: _changeLanguage,
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _saveSettings,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Container(
              color: const Color(0xFFF9F4FF),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  
                  // Dark Mode
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: isDarkMode,
                    onChanged: (val) {
                      setState(() {
                        isDarkMode = val;
                      });
                    },
                  ),
                  
                  // Volume
                  ListTile(
                    title: const Text('Volume'),
                    subtitle: Slider(
                      value: volume,
                      min: 0,
                      max: 1,
                      divisions: 10,
                      label: (volume * 100).round().toString(),
                      onChanged: (val) {
                        setState(() {
                          volume = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

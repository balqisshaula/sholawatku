import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../globals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _volume = volumeNotifier.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('Settings', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)),
                  const SizedBox(height:12),
                  ValueListenableBuilder<bool>(
                    valueListenable: darkModeNotifier,
                    builder: (context, isDark, _) {
                      return SwitchListTile(
                        title: const Text('Dark Mode'),
                        value: isDark,
                        onChanged: (v) => darkModeNotifier.value = v,
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Volume'),
                    subtitle: Slider(
                      value: _volume,
                      min: 0, max: 1, divisions: 10,
                      onChanged: (v) {
                        setState(() => _volume = v);
                        volumeNotifier.value = v;
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

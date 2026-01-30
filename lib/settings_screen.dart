import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ValueNotifier<double> fontSizeNotifier;

  const SettingsScreen({super.key, required this.fontSizeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Font Size'),
            ValueListenableBuilder<double>(
              valueListenable: fontSizeNotifier,
              builder: (context, fontSize, _) {
                return Slider(
                  value: fontSize,
                  min: 20.0,
                  max: 200.0,
                  onChanged: (value) {
                    fontSizeNotifier.value = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

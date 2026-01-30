import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ValueNotifier<double> fontSizeNotifier;
  final ValueNotifier<double> brightnessNotifier;

  const SettingsScreen({
    super.key,
    required this.fontSizeNotifier,
    required this.brightnessNotifier,
  });

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
            const SizedBox(height: 20),
            const Text('Brightness'),
            ValueListenableBuilder<double>(
              valueListenable: brightnessNotifier,
              builder: (context, brightness, _) {
                return Slider(
                  value: brightness,
                  min: 0.1,
                  max: 1.0,
                  onChanged: (value) {
                    brightnessNotifier.value = value;
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

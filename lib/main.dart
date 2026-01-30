import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapp/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screensaver Clock',
      theme: ThemeData.dark(),
      home: const ClockScreen(),
    );
  }
}

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late Timer _timer;
  late DateTime _now;
  final ValueNotifier<double> _fontSizeNotifier = ValueNotifier(100.0);
  bool _isFullscreen = false;
  bool _isLandscape = false;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _fontSizeNotifier.dispose();
    super.dispose();
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
      if (_isFullscreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  void _toggleRotation() {
    setState(() {
      _isLandscape = !_isLandscape;
      if (_isLandscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(fontSizeNotifier: _fontSizeNotifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _isFullscreen
          ? null
          : AppBar(
              title: const Text('Screensaver Clock'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.screen_rotation),
                  onPressed: _toggleRotation,
                ),
                IconButton(
                  icon: const Icon(Icons.fullscreen),
                  onPressed: _toggleFullscreen,
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: _navigateToSettings,
                ),
              ],
            ),
      body: GestureDetector(
        onTap: () {
          if (_isFullscreen) {
            _toggleFullscreen();
          }
        },
        child: Center(
          child: ValueListenableBuilder<double>(
            valueListenable: _fontSizeNotifier,
            builder: (context, fontSize, _) {
              return Text(
                DateFormat('HH:mm:ss').format(_now),
                style: TextStyle(fontSize: fontSize),
              );
            },
          ),
        ),
      ),
    );
  }
}

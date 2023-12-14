import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/firebase_options.dart';
import 'package:helping_hands/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlueAccent,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      themeMode: themeMode,
      home: HomePage(
        setThememode: setThemeMode,
        themeMode: themeMode,
      ),
    );
  }
}

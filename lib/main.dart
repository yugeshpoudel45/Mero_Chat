import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:momogram/services/auth/auth_gate.dart';
import 'package:momogram/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const AuthGate(),
    );
  }
}

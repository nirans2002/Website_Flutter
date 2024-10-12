import 'package:flutter/material.dart';
import 'package:niransnarayanan/pages/admin/admin_login_screen.dart';
import 'package:niransnarayanan/pages/admin/admin_page.dart';
import 'package:niransnarayanan/pages/home_page/home_page.dart';
import 'package:niransnarayanan/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      theme: darkTheme,
      // darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => AdminPage(),
      },
    );
  }
}

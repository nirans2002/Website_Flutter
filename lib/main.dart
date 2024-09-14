import 'package:flutter/material.dart';
import 'package:niransnarayanan/firebase/firebase_service_bkp.dart';
import 'package:niransnarayanan/pages/admin/admin_login_sccreen.dart';
import 'package:niransnarayanan/pages/admin/admin_page.dart';
import 'package:niransnarayanan/utils/theme.dart';
import 'package:provider/provider.dart';
import 'pages/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
      initialRoute: '/login',
      routes: {
        // '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import './providers/auth.dart';
import 'package:provider/provider.dart';
import './views/info.dart';
import './views/login.dart';
import './views/register.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MainView()));
}

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => InfoPage(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage()
    });
  }
}

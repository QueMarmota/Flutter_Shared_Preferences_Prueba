import 'package:flutter/material.dart';
import 'package:mi_shared_preferences_pueba/routes/routes.dart';
import 'package:mi_shared_preferences_pueba/screens/home.dart';
import 'package:mi_shared_preferences_pueba/shared_preferences/shared_preferences.dart';

//Inicializar las preferencias en el nivel de mayor jerarquia como el main
void main() async {
  final prefs = new MiSharedPreferences();
  await prefs.initprefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new MiSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.lastPage,
      routes: getApplicationRoutes(),
      title: 'Material App',
    );
  }
}

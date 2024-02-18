import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/pages/home_games.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      //Para poner el titulo de la APP o en el navegador
      title: 'Service Games',
      //El tema
      theme: ThemeData.dark(),
      home: const HomeGames(),
      debugShowCheckedModeBanner: false,
    );
  }
}

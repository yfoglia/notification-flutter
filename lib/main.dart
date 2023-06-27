import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Nombres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> nombres = [
    'Lanús',
    'Lomas',
    'Adrogué',
    'Burzaco',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Nombres'),
      ),
      body: ListView.builder(
        itemCount: nombres.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailPage.routeName,
                  arguments: nombres[index]);
            },
            child: Card(
              child: Hero(
                tag: nombres[index],
                child: ListTile(
                  title: Text(nombres[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail';

  final List<String> nombresBares = [
    'Bar 1',
    'Bar 2',
    'Bar 3',
    'Bar 4',
    'Bar 5',
  ];

  String getRandomBar() {
    final random = Random();
    return nombresBares[random.nextInt(nombresBares.length)];
  }

  @override
  Widget build(BuildContext context) {
    final String nombre = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: ListView.builder(
        itemCount: nombresBares.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(nombresBares[index]),
            ),
          );
        },
      ),
    );
  }
}

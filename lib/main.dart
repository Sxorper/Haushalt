import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  final List<String> tasks = ["Bio-, Rest- und Plastikmüll rausbringen", "Küche", "Badezimmer unten", "Treppe", "Badezimmer oben"];
  final List<String> persons = ["Josse", "Gretje", "Mattis", "Lasse", "Tjorven"];

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime startDate = DateTime(2023, 1, 1); // Festes Startdatum

    int weeksPassed = currentDate.difference(startDate).inDays ~/ 7;

    return Scaffold(
      appBar: AppBar(
        title: Text('Haushaltsaufgaben'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          int responsibleIndex = (index + weeksPassed) % persons.length;
          String responsiblePerson = persons[responsibleIndex];
          return ListTile(
            title: Text(tasks[index]),
            subtitle: Text('Verantwortlich: $responsiblePerson'),
          );
        },
      ),
    );
  }
}

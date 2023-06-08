import 'package:flutter/material.dart';

import 'Stateful.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Github Project",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          shadowColor: Colors.lightBlueAccent,
          title: const Text("My All Github Project"),
          centerTitle: true,
        ),
        body:  const MyHomePage(),
      ),

    );
  }
}

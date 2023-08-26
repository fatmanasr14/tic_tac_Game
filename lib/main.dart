import 'package:flutter/material.dart';
import 'package:tic/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(255, 18, 57, 77),
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const homepage(),
    );
  }
}

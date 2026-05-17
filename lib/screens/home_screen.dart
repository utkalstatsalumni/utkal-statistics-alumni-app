import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utkal Statistics Alumni Association'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Utkal Statistics Alumni Association App - Stay Connected, Stay Informed!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:Cipherium/pages/Splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cipherium());
}

class Cipherium extends StatelessWidget {
  const Cipherium({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app/views/imc_page.dart';

void main() => runApp(HomePage());





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Imc_Page(),
    );
  }
}
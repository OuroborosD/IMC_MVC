import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imc_app/widgets/Card_Imc.dart';

class Imc_Page extends StatelessWidget {
  const Imc_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex:2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Calculate your IMC',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'O IMC é uma medida internacional usada para calcular se uma pessoa está no peso ideal.',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                  ]),
                ),
              ),
              Flexible(
                flex:3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        // para fazer o topo do conteiner ficar coma borda redonda
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 55),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text('image'),
                    Card_Imc(),
                    Card_Imc(),
                    ElevatedButton(onPressed: () {}, child: Text('Result')),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

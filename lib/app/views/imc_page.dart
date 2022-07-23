import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imc_app/app/controllers/imc_calc.dart';
import 'package:imc_app/widgets/Card_Imc.dart';
import '../../widgets/Card_Imc.dart';
import '../models/imc.dart';

class Imc_Page extends StatefulWidget {
  Imc_Page({super.key});

  @override
  State<Imc_Page> createState() => _Imc_PageState();
}

class _Imc_PageState extends State<Imc_Page> {
  final TextEditingController input_heigth = TextEditingController();

  final TextEditingController input_weigth = TextEditingController();

  double? imc;
  String status = 'aguardados dados';
  String? Img_path;

  bool get empty => Img_path == null;
  bool get empty_imc => imc == null;
                  
  void send_input() {
     
    Imc person =  Imc(int.parse(input_heigth.text),double.parse(input_weigth.text));
    Controller_Imc p1 = Controller_Imc();
    input_heigth.clear();
    input_weigth.clear();
    setState(() {
      imc = person.imc_calc();
      Img_path = p1.img(imc!);
      status = p1.status(imc!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
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
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      // para fazer o topo do conteiner ficar coma borda redonda
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 55),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset( empty ? 'assets/images/normal.png' : Img_path!,
                            height: 94, width: 62, fit: BoxFit.scaleDown),
                        Text(status),
                        Text(empty_imc ? 'Imc não foi calculado ainda' : 'imc: $imc'),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text('Weigth(KG)'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TextField(
                                        controller: input_weigth,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text('Heigth(CM)'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TextField(
                                        controller: input_heigth,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: send_input,
                            child: Text('Result'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 20),
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)))),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

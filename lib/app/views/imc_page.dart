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
  int Img_path = 0;

  List<Color> lista_cores =[
    Colors.blue,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  Imc person = Imc();

  bool get empty => Img_path == null;
  bool get empty_imc => imc == null;
  bool get empty_heigth => person.weight == 0;
  void send_input() {
    person.height = int.parse(input_heigth.text);
    person.weight = double.parse(input_weigth.text);
    if (person.height != 0 && person.weight != 0) {
      input_heigth.clear();
      input_weigth.clear();
      Controller_Imc p1 = Controller_Imc();
      setState(() {
        print('h:${person.height}   ---  w:${person.weight}');
        imc = person.imc_calc();
        Img_path = p1.img(imc!);
        status = p1.status(imc!);
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(empty_heigth
                    ? 'Weigth invalid! put a number beetwen 5 and 400 KG'
                    : 'Heigth invalid! put a number beetwen 20 and 250 CM'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('voltar'))
                ],
              ));
    }
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
                        // Image.asset(
                        //     empty ? 'assets/images/normal.png' : Img_path!,
                        //     height: 94,
                        //     width: 62,
                        //     fit: BoxFit.scaleDown),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              
                              children: [
                                Flexible(
                                  flex:8,
                                  fit: FlexFit.tight,
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(20,20,0,20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              // para fazer o topo do conteiner ficar coma borda redonda
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft: Radius.circular(40.0),
                                            ),
                                          border: Border.all(
                                              color: lista_cores[Img_path] as Color, width: 4)),
                                          
                                      child: Text(
                                        status,
                                        overflow: TextOverflow.fade,
                                      )),
                                ),
                                Flexible(
                                  flex:5,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18),
                                    decoration: BoxDecoration(
                                       color: lista_cores[Img_path] as Color, 
                                       borderRadius: BorderRadius.only(
                                              // para fazer o topo do conteiner ficar coma borda redonda
                                              topRight: Radius.circular(40.0),
                                              bottomRight: Radius.circular(40.0),
                                            ),
                                        border: Border.all(
                                            color: lista_cores[Img_path] as Color, width: 4)),
                                    child: Text(
                                        empty_imc
                                            ? '0'
                                            : 'Imc: ${imc!.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          //background: Colors.blue,
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                        overflow: TextOverflow.fade),
                                  ),
                                )
                              ],
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

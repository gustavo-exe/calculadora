import 'package:calculadora/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {
  String history = "";
  String expresion = "";

  void clear(String text) {
    setState(() {
      expresion = "";
    });
  }

  void allClear(String text) {
    setState(() {
      history = "";
      expresion = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expresion);
    ContextModel cm = ContextModel();
    setState(() {
      history = expresion;
      expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numeroClick(String text) {
    setState(() {
      expresion += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.black)),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: (Text(
                    expresion,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 48, color: Colors.black)),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: allClear,
                    text: 'AC',
                    textSize: 20,
                    bgColor: const Color.fromRGBO(178, 152, 220, 1),
                  ),
                  CalcButton(
                    callback: clear,
                    text: 'C',
                    bgColor: const Color.fromRGBO(178, 152, 220, 1),
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '%',
                    callback: numeroClick,
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: () => {},
                    text: '/',
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                      callback: numeroClick,
                      text: '7',
                      textSize: 20,
                      bgColor: Colors.black12),
                  CalcButton(
                    callback: numeroClick,
                    bgColor: Colors.black12,
                    text: '8',
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    text: '9',
                    bgColor: Colors.black12,
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    text: '*',
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                      callback: numeroClick,
                      text: '4',
                      textSize: 20,
                      bgColor: Colors.black12),
                  CalcButton(
                    callback: numeroClick,
                    bgColor: Colors.black12,
                    text: '5',
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    text: '6',
                    bgColor: Colors.black12,
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    text: '-',
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                      callback: numeroClick,
                      text: '1',
                      textSize: 20,
                      bgColor: Colors.black12),
                  CalcButton(
                    callback: numeroClick,
                    text: '2',
                    bgColor: Colors.black12,
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    bgColor: Colors.black12,
                    text: '3',
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    text: '+',
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                      callback: numeroClick,
                      text: '.',
                      textSize: 20,
                      bgColor: Colors.black12),
                  CalcButton(
                    callback: numeroClick,
                    text: '0',
                    bgColor: Colors.black12,
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: numeroClick,
                    bgColor: Colors.black12,
                    text: '00',
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '=',
                    callback: evaluate,
                    bgColor: const Color.fromRGBO(185, 250, 248, 1),
                    textSize: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

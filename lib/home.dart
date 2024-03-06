import 'package:calculator/widgets/numpad.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayValue = '0';
  double leftOperand = 0;
  double rightOperand = 0;
  late String currentOperation;

  onNumClick(String aValue) {
    if (rightOperand == 0) {
      displayValue = displayValue == '0' ? aValue : displayValue + aValue;
    } else {
      displayValue = aValue;
      rightOperand = 0;
    }

    displayValue = displayValue.replaceAll(',', '');
    displayValue = NumberFormat.decimalPatternDigits(
            decimalDigits: displayValue.contains('.') ? 1 : 0)
        .format(double.parse(displayValue));
  }

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              height: sHeight / 3,
              width: sWidth,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: Text(
                    displayValue,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numPadWidget(
                    character: displayValue == '0' ? 'AC' : 'C',
                    fSize: displayValue == '0' ? 20 : 25,
                    fColor: Colors.grey,
                    callback: () {
                      setState(() {
                        displayValue = '0';
                        leftOperand = 0;
                        rightOperand = 0;
                      });
                    },
                  ),
                  numPadWidget(
                    character: '+/-',
                    fColor: Colors.grey,
                    fSize: 25,
                    callback: () {
                      setState(() {
                        if (displayValue.isNotEmpty) {
                          if (displayValue[0] != '-') {
                            displayValue = ('-$displayValue');
                          } else {
                            displayValue = displayValue.substring(1);
                          }
                        }
                      });
                    },
                  ),
                  numPadWidget(
                    character: '%',
                    fColor: Colors.grey,
                    callback: () {
                      setState(() {
                        currentOperation = 'percentage';
                        leftOperand = double.parse(displayValue);
                        leftOperand = leftOperand / 100;
                        displayValue = leftOperand.toString();
                      });
                    },
                  ),
                  numPadWidget(
                    character: '÷',
                    fColor: const Color.fromRGBO(221, 156, 58, 0.918),
                    callback: () {
                      setState(() {
                        currentOperation = 'division';
                        displayValue = displayValue.replaceAll(',', '');

                        if (leftOperand == 0) {
                          leftOperand = double.parse(displayValue);
                          displayValue = '';
                        } else {
                          rightOperand = double.parse(displayValue);
                          leftOperand = leftOperand / rightOperand;
                          displayValue = leftOperand.toString();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numPadWidget(
                    character: '7',
                    callback: () {
                      setState(() {
                        onNumClick('7');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '8',
                    callback: () {
                      setState(() {
                        onNumClick('8');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '9',
                    callback: () {
                      setState(() {
                        onNumClick('9');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '*',
                    fColor: const Color.fromRGBO(221, 156, 58, 0.918),
                    callback: () {
                      setState(() {
                        currentOperation = 'multiplication';
                        displayValue = displayValue.replaceAll(',', '');

                        if (leftOperand == 0) {
                          leftOperand = double.parse(displayValue);
                          displayValue = '';
                        } else {
                          rightOperand = double.parse(displayValue);
                          leftOperand = leftOperand * rightOperand;
                          displayValue = leftOperand.toString();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numPadWidget(
                    character: '4',
                    callback: () {
                      setState(() {
                        onNumClick('4');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '5',
                    callback: () {
                      setState(() {
                        onNumClick('5');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '6',
                    callback: () {
                      setState(() {
                        onNumClick('6');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '-',
                    fColor: Color.fromRGBO(221, 156, 58, 0.918),
                    callback: () {
                      setState(
                        () {
                          currentOperation = 'subtraction';
                          displayValue = displayValue.replaceAll(',', '');

                          if (leftOperand == 0) {
                            leftOperand = double.parse(displayValue);
                            displayValue = '';
                          } else {
                            rightOperand = double.parse(displayValue);
                            leftOperand = leftOperand - rightOperand;
                            displayValue = leftOperand.toString();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numPadWidget(
                    character: '1',
                    callback: () {
                      setState(() {
                        onNumClick('1');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '2',
                    callback: () {
                      setState(() {
                        onNumClick('2');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '3',
                    callback: () {
                      setState(() {
                        onNumClick('3');
                      });
                    },
                  ),
                  numPadWidget(
                    character: '+',
                    fColor: const Color.fromRGBO(221, 156, 58, 0.918),
                    callback: () {
                      setState(() {
                        currentOperation = 'addition';
                        displayValue = displayValue.replaceAll(',', '');

                        if (leftOperand == 0) {
                          leftOperand = double.parse(displayValue);
                          displayValue = '';
                        } else {
                          rightOperand = double.parse(displayValue);
                          leftOperand = leftOperand + rightOperand;
                          displayValue = leftOperand.toString();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  numPadWidget(
                    vWidth: 148,
                    character: '0',
                    callback: () {
                      setState(() {
                        // onNumClick('0');
                        displayValue =
                            displayValue == '0' ? "0" : "${displayValue}0";
                      });
                    },
                  ),
                  numPadWidget(
                    character: '.',
                    callback: () {
                      setState(() {
                        if (!displayValue.contains('.')) {
                          displayValue = '$displayValue.';
                        } else {
                          displayValue = displayValue;
                        }
                      });
                    },
                  ),
                  numPadWidget(
                    character: '=',
                    fColor: const Color.fromRGBO(221, 156, 58, 0.918),
                    callback: () {
                      setState(() {
                        displayValue = displayValue.replaceAll(',', '');
                        rightOperand = double.parse(displayValue);
                        switch (currentOperation) {
                          case 'addition':
                            leftOperand = (leftOperand + rightOperand);
                            displayValue = leftOperand.toString();
                            break;
                          case 'subtraction':
                            leftOperand = (leftOperand - rightOperand);
                            displayValue = leftOperand.toString();
                            break;
                          case 'multiplication':
                            leftOperand = (leftOperand * rightOperand);
                            displayValue = leftOperand.toString();
                            break;
                          case 'division':
                            leftOperand = (leftOperand / rightOperand);
                            displayValue = leftOperand.toString();
                            break;
                        }
                        leftOperand = 0;
                        rightOperand = 0;
                        currentOperation = '';
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

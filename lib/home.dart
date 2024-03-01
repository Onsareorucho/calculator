import 'package:calculator/widgets/numpad.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayValue = '';
  late double leftOperand;
  late double rightOperand;
  late String currentOperation;
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.amber),
            height: sHeight / 3,
            width: sWidth,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                displayValue,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numPadWidget(
                  character: 'C',
                  callback: () {
                    setState(() {
                      displayValue = '';
                    });
                  },
                ),
                numPadWidget(
                  character: '+/-',
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
                  callback: () {
                    setState(() {
                      currentOperation = 'percentage';
                      leftOperand = double.parse(displayValue);
                      displayValue = '';
                    });
                  },
                ),
                numPadWidget(
                  character: '÷',
                  callback: () {
                    setState(() {
                      currentOperation = 'division';
                      leftOperand = double.parse(displayValue);
                      displayValue = '';
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
                      displayValue = "${displayValue}7";
                    });
                  },
                ),
                numPadWidget(
                  character: '8',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}8";
                    });
                  },
                ),
                numPadWidget(
                  character: '9',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}9";
                    });
                  },
                ),
                numPadWidget(
                  character: '*',
                  callback: () {
                    setState(() {
                      currentOperation = 'multiplication';
                      leftOperand = double.parse(displayValue);
                      displayValue = '';
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
                      displayValue = "${displayValue}4";
                    });
                  },
                ),
                numPadWidget(
                  character: '5',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}5";
                    });
                  },
                ),
                numPadWidget(
                  character: '6',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}8";
                    });
                  },
                ),
                numPadWidget(
                  character: '-',
                  callback: () {
                    setState(() {
                      currentOperation = 'subtraction';
                      leftOperand = double.parse(displayValue);
                      displayValue = '';
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
                  character: '1',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}1";
                    });
                  },
                ),
                numPadWidget(
                  character: '2',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}2";
                    });
                  },
                ),
                numPadWidget(
                  character: '3',
                  callback: () {
                    setState(() {
                      displayValue = "${displayValue}3";
                    });
                  },
                ),
                numPadWidget(
                  character: '+',
                  callback: () {
                    setState(() {
                      currentOperation = 'addition';
                      leftOperand = double.parse(displayValue);
                      displayValue = '';
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
                      displayValue = "${displayValue}0";
                    });
                  },
                ),
                numPadWidget(
                  character: '.',
                  callback: () {
                    setState(() {
                      displayValue = '';
                    });
                  },
                ),
                numPadWidget(
                  character: '=',
                  callback: () {
                    setState(() {
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
    );
  }
}

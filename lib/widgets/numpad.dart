import 'package:flutter/material.dart';

class numPadWidget extends StatelessWidget {
  final String character;
  final double vWidth;
  final double fSize;
  final Color fColor;

  final void Function()? callback;

  numPadWidget({
    super.key,
    required this.character,
    required this.callback,
    this.vWidth = 60,
    this.fSize = 35,
    this.fColor = const Color.fromARGB(255, 48, 45, 45),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: vWidth,
      height: 60,
      decoration: BoxDecoration(
        color: fColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: callback,
        child: Text(
          character,
          style: TextStyle(fontSize: fSize, color: Colors.white),
        ),
      ),
    );
  }
}

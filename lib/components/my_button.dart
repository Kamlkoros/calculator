import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key,required this.text,this.buttonColor = Colors.grey, required this.onPressed});

  final String text;
  final Color buttonColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(80, 80),
            backgroundColor: buttonColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Text(text, style: TextStyle(color: Colors.white,fontSize: 16)),
        ),
      ),
    );
  }
}

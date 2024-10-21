import 'package:flutter/material.dart';

class Primarybutton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Color? backgroundColor; 
  final TextStyle? textStyle; 

  const Primarybutton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  State<StatefulWidget> createState() {
    return _PrimarybuttonState();
  }
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              widget.backgroundColor ?? const Color.fromRGBO(36, 62, 76, 1)),
        ),
        onPressed: widget.onButtonPressed,
        child: Text(
          widget.buttonText,
          style: widget.textStyle ?? const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
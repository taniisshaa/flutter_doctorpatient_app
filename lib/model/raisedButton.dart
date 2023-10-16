import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  const RaisedButton (
      {Key? key,
        required this.title,

        required this.onPressed, required TextStyle style,})
      : super(key: key);


  final String title;

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.white,
        ),

        onPressed: () {  },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

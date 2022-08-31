import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent ,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.purpleAccent)) ,
          minimumSize: const Size(double.infinity, 10),
        ),


    );


  }
}

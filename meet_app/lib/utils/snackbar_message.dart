import 'package:flutter/material.dart';

snackBarMessage (BuildContext context, String text){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(text)));
}
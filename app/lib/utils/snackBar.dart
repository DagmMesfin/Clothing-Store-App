import 'package:flutter/material.dart';

showSnack(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(
        seconds: 3,
      ),
    ),
  );
}

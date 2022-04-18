import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnakBarWidget {
 static mymessger(BuildContext context, text, color) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: color,
        ),

      );
}

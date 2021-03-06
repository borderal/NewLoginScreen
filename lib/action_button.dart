import 'dart:js';

import 'package:flutter/material.dart';

Widget actionButton(String text) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFFFE4350),
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFFE4350).withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

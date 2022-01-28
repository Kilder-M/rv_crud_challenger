import 'package:flutter/material.dart';

Widget viewsTitles({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child:  Text(
      title,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}

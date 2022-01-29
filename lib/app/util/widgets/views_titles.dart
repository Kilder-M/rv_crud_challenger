import 'package:flutter/material.dart';

Widget viewsTitles({required String title,bool? isButtonAdd}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child:  Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
          ),
        ),
        (isButtonAdd == true) ? GestureDetector(
          child:  Padding(
            padding:  const EdgeInsets.only(left: 3.0),
            child: Icon(Icons.add_circle,color: Colors.green[400], size: 24,), 
          ),
        ) : Container()
      ],
    ),
  );
}

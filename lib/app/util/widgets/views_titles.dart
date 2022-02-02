import 'package:flutter/material.dart';

Widget viewsTitles(
    {required String title, bool? isButtonAdd, final void Function()? onBack,final void Function()? onTapAddIcon}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      children: [
        (onBack != null)
            ? GestureDetector(
                onTap: onBack,
                child: const Icon(
                  Icons.chevron_left,
                  size: 28,
                ),
              )
            : Container(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
          ),
        ),
        (isButtonAdd == true)
            ? GestureDetector(
                onTap: onTapAddIcon,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.green[400],
                    size: 24,
                  ),
                ),
              )
            : Container()
      ],
    ),
  );
}

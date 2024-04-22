import 'package:flutter/material.dart';

BoxDecoration buttonDecoration() {
  return BoxDecoration(
      color: Colors.amber, borderRadius: BorderRadius.circular(20));
}

BoxDecoration mainGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black,
        Colors.purple,
      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking/components/decorations.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: mainGradient(),
          child: const Text('this is driver page'),
        ),
      ),
    );
  }
}

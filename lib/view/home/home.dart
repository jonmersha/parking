import 'package:flutter/material.dart';
import 'package:parking/components/decorations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: width,
        decoration: mainGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            navigationButton(context, width,'/driver','Driver'),
            navigationButton(context, width,'/parking','Parking'),
          ],
        ),
      ),
    );
  }

  GestureDetector navigationButton(BuildContext context, double width,String path,String title) {
    return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, path);
            },
            child: Container(
              height: 60,
              width: width / 2,
              alignment: Alignment.center,
              decoration: buttonDecoration(),
              child: Text(title, style:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          );
  }

}
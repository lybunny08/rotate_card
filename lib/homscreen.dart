import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0;
  double y = 0;
  double amplitude = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..rotateX(x)
            ..rotateY(y), //to rotate the card
          child: GestureDetector(
            onPanUpdate: (details) {
              if (y - details.delta.dx < 0) {
                setState(() {
                  y = max(y - details.delta.dx / 100, -amplitude);
                });
              } else {
                setState(() {
                  y = min(y - details.delta.dx / 100, amplitude);
                });
              }

              //for x

              if (x + details.delta.dy < 0) {
                setState(() {
                  x = max(x + details.delta.dy / 100, -amplitude);
                });
              } else {
                setState(() {
                  x = min(x + details.delta.dy / 100, amplitude);
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/HEHE.jpeg",
                      ),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(203, 127, 184, 1),
                        blurRadius: 28,
                        offset: Offset(x * 80, -x * 80))
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}

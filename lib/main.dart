import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Clock_app());
}

class Clock_app extends StatefulWidget {
  const Clock_app({super.key});

  @override
  State<Clock_app> createState() => _Clock_appState();
}

DateTime dateTime = DateTime.now();

class _Clock_appState extends State<Clock_app> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 250,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ...List.generate(
                          60,
                          (index) => Transform.rotate(
                              angle: (index * 6 * pi) / 180,
                              child: (index%5==0)?Text('1',style:TextStyle(color: Colors.black,fontSize: 30),):VerticalDivider(
                                  thickness: 3, endIndent: 245))),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.black,
                      ),
                      Transform.rotate(
                        angle: dateTime.second * 6 * pi / 180,
                        child: VerticalDivider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 100,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.minute * 6 * pi / 180,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 3,
                          indent: 30,
                          endIndent: 100,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.hour * 30 * pi / 180,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 4,
                          indent: 45,
                          endIndent: 100,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

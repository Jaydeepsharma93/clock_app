import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Clock());
}

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Clock_app(),
        '/stoper': (context) => Stoper()
      },
    );
  }
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
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${dateTime.hour % 12} : ${dateTime.minute}",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Container(
                    alignment: Alignment.center,
                    height: 280,
                    decoration: const BoxDecoration(
                        color: Color(0xfff9f9f9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 10,
                              blurRadius: 30)
                        ]),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 230,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 35),
                              shape: BoxShape.circle,
                            // boxShadow: [
                            //   BoxShadow(
                              //       color: Colors.black12,
                              //       spreadRadius: 5,
                              //       blurRadius: 30)
                              // ]
                            ),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle),
                          ),
                        ),
                        // ...List.generate(
                        //   60,
                        //   (index) => Transform.rotate(
                        //     angle: (index * 6 * pi) / 180,
                        //     child: (index % 5 == 0)
                        //         ? const VerticalDivider(
                        //             thickness: 4,
                        //             endIndent: 240,
                        //             color: Colors.black)
                        //         : const VerticalDivider(thickness: 3, endIndent: 245),
                        //   ),
                        // ),
                        const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.black,
                        ),
                        Transform.rotate(
                          angle: dateTime.second * 6 * pi / 180,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            thickness: 3,
                            indent: 28,
                            endIndent: 120,
                          ),
                        ),
                        Transform.rotate(
                          angle: dateTime.minute * 6 * pi / 180,
                          child: const VerticalDivider(
                            color: Colors.black,
                            thickness: 4,
                            indent: 35,
                            endIndent: 122,
                          ),
                        ),
                        Transform.rotate(
                          angle: (dateTime.hour % 12 + dateTime.minute / 60) *
                              30 *
                              pi /
                              180,
                          child: const VerticalDivider(
                            color: Colors.black,
                            thickness: 5,
                            indent: 55,
                            endIndent: 125,
                          ),
                        ),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.access_time_outlined,size: 35,)),
                      Text("clock",style:TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.timelapse_outlined,size: 35,)),
                      Text("timer",style:TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/stoper');
                      }, icon: Icon(Icons.timer_outlined,size: 35,)),
                      Text("stoper",style:TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



class Stoper extends StatefulWidget {
  const Stoper({super.key});

  @override
  State<Stoper> createState() => _StoperState();
}

class _StoperState extends State<Stoper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}


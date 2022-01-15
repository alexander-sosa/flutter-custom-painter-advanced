import 'dart:math';

import 'package:flutter/material.dart';
import 'package:renderizacion/modelos.dart';

import 'graficos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Lamp> vLamp = [];
  var rnd = Random();
  double radians = 0;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CustomPaint(painter: DibujaLampara(vLamp, radians),)
          ]
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: (){
                    setState(() {
                      double x = rnd.nextDouble() * screen.width;
                      double y = rnd.nextDouble() * screen.height;

                      double w = rnd.nextDouble() * screen.width/4;
                      double h = rnd.nextDouble() * screen.height/4;

                      int red = rnd.nextInt(256);
                      int green = rnd.nextInt(256);
                      int blue = rnd.nextInt(256);

                      vLamp.add(Lamp(x, y, w, h, Color.fromARGB(1000, red, green, blue)));
                    });
                  }
              ),
              IconButton(
                  icon: Icon(Icons.rotate_right),
                  onPressed: (){
                    setState(() {
                      radians = radians + 0.1;
                    });
                  }
              ),
              IconButton(
                  icon: Icon(Icons.rotate_left),
                  onPressed: (){
                    setState(() {
                      radians = radians - 0.1;
                    });
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

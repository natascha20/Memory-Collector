import 'dart:developer';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Image val;

  void initState() {
    super.initState();
    val = Image.asset('assets/sea.jpg');
  }

  void change() {
    setState(() {
      val = Image.asset('assets/space.jpg');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue[100],
      title: Text("Memory-collector"),
    ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('$val'))),
            FloatingActionButton(
              backgroundColor: Colors.blue[100],
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          child: Counter(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  runApp(MyApp());
}

/*
InkWell(
          child: Image.network('data:image/jpeg;base64,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'),
          );


          class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double val;

  void initState(){
    super.initState();
    val = 0;
  }

  void change(){
    setState(() {
      val += 1;
    });
  }
}
 */
/*


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[100],
        child: Icon(Icons.add),
         onPressed: (){

         }),

      body: Center(
          child: Image.network('https://www.zooplus.de/magazin/wp-content/uploads/2020/10/kitten-sitzt-boden-768x512.jpeg'),
      ),
    ),
  ));
 */
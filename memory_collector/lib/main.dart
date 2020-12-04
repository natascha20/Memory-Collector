import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
        backgroundColor: Colors.blue[100],
      ),
      backgroundColor: Colors.white,
     appBar:
     AppBar(
       backgroundColor: Colors.blue[100],
       title: Text('Memory-Collector'),
     ),
    ),
  ));
}

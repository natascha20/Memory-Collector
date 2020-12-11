import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String title = "";
String summary = "";
String date = "";
int _selectedIndex;

void setState(Null Function() param0) {}

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MemoryCollector',
      theme: ThemeData(
        primaryColor: Colors.pink[200],
        accentColor: Colors.deepOrange[100],
      ),
      home: MyHomePage(title: 'MemoryCollector'),
    );
  }
}

class New extends StatelessWidget {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('New'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            color: Theme.of(context).accentColor,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2020, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                newDateTime = date as DateTime;
              },
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                          onChanged: (text) {
                            title = text;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            labelText: 'Titel',
                          )),
                      TextField(
                          onChanged: (text) {
                            summary = text;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            labelText: 'Text',
                          )),
                      ElevatedButton(
                        child: Text('Home'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text('Location'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Location()),
                          );
                        },
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).accentColor,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(date + ' ' + title + '\n' + summary),
              );
            },
          );
        },
        tooltip: 'Show me the value',
        child: Icon(Icons.send),
      ),
    );
  }
}

class Location extends StatelessWidget {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Home'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            child: Text('New'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('New'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => New()),
              );
            },
          ),
          ElevatedButton(
            child: Text('Location'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Location()),
              );
            },
          )
        ],
      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String title = "";
String summary = "";
DateTime date;
String location = "";
List post;
void setState(Null Function() param0) {}


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
        highlightColor: Colors.deepPurple[50],
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
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      MyCustomForm(),
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
          ),
        ],
      ),
      if (post != [])
          Container(
            child: Text('$post'),
          ),
    );

  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Theme.of(context).accentColor,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2020, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                date = newDateTime;
              },
            ),
          ),
          TextFormField(
            onChanged: (text) {
              title = text;
            },
            decoration: InputDecoration(
              labelText: 'Titel',
            ),
          ),
          TextFormField(
            onChanged: (text) {
              summary = text;
            },
            decoration: InputDecoration(
              labelText: 'Beschreibung',
            ),
          ),
          TextFormField(
            onChanged: (text) {
              location = text;
            },
            decoration: InputDecoration(
              labelText: 'Ort',
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
            ),
            child: Text('save'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context);
              }
              Navigator.pop(context);
              List post = [title, summary, location];
            },
          ),
        ],
      ),
    );
  }
}

/*
return showDialog(
                context: context,
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Theme
                        .of(context)
                        .accentColor,
                    body: Column(
                      children: <Widget>[
                        Container(
                            child: Text('\n Titel: ' + title + '\n Beschreibung: ' + summary + '\n Ort: ' + location),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).highlightColor,
                          ),
                          padding: EdgeInsets.all(40.0),
                          margin: EdgeInsets.all(25.0),
                        ),
                      ],
                    ),
                  );
                },
              );
 */
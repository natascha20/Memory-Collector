import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String value = "";

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Erinnerungen', 'Orte', 'Datum', 'Fotos'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme
          .of(context)
          .primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex
                      ? Colors.white
                      : Theme
                      .of(context)
                      .accentColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image _counter = Image.asset('img/Paper Flora.jpg');

  void _incrementCounter() {
    setState(() {
      _counter = Image.asset("img/Logo 500x500 px.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (text) {
                      value = text;
                    },
                    cursorColor: Theme
                        .of(context)
                        .primaryColor,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    decoration: InputDecoration(
                      labelText: 'Titel',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                content: Text(value),
                              );
                            },
                          );
                        },
                      )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).accentColor,
        onPressed: (){},
        tooltip: 'Show me the value',
        child: Icon(Icons.favorite),
        ),
        );
    }
  }
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:memorycollector/model/memory.dart';
//import 'package:memorycollector/utils/Database.dart';

//Connection to db
void _saveNewMemory(String titleController, String summaryController) async {
  var settings = new ConnectionSettings(
      host: 'mysql2.webland.ch',
      user: 'd041e_memorycollector',
      password: 'Memory_12345',
      db: 'd041e_memorycollector');
  var conn = await MySqlConnection.connect(settings);
  var header = titleController;
  var description = summaryController;
  var date = DateTime.now();
  var insert = await conn.query(
      'INSERT INTO `memories`(`id`, `title`, `description`, `date`) VALUES (?,?,?,?)',
      ['', '$header', '$description', '$date']);

  var inserts = await conn.query(
      'select title, description from memories where id = ?',
      [insert.insertId]);

  for (var row in inserts) {
    List text = [''];
    text.add(row[0]);
    text.add(row[1]);
    print(text);
    Text('$text');
  }
  conn.close();
}

String title = "";
String summary = "";
DateTime date;

void setState(Function() param0) {}

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
        primaryColor: Colors.lightBlue[100],
        accentColor: Colors.green[50],
        highlightColor: Colors.deepPurple[50],
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
          MyCustomForm(),
          //MyDatePicker(),
        ],
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
  final summaryController = TextEditingController();
  final titleController = TextEditingController();

  void _printLatestValue() {
    print("Second text field: ${summaryController.text}");
    print("Second text field: ${titleController.text}");
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    summaryController.addListener(_printLatestValue);
    titleController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    summaryController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (text) {
              text = title;
            },
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Titel',
            ),
          ),
          TextFormField(
            onChanged: (text) {
              text = summary;
            },
            controller: summaryController,
            decoration: InputDecoration(
              labelText: 'Beschreibung',
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            child: Text('save'),
            onPressed: () async {
              //send data to db
              _saveNewMemory(titleController.text, summaryController.text);
            },
          ),
        ],
      ),
    );
  }
}

/*
class MyDatePicker extends StatefulWidget {
  @override
  MyDatePickerState createState() {
    return MyDatePickerState();
  }
}

class MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime;
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Pick a date'),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010),
              lastDate: DateTime(2021),
            ).then((date) {
              setState(() {
                _dateTime = date;
              });
            });
          },
        ),
        Text(_dateTime == null ? 'Nothing' : _dateTime.toString()),
      ],
    );
  }
}


 */

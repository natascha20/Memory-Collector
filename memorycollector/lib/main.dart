import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String title = "";
String summary = "";
DateTime date;
String location = "";

var post = new List(3);

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source){
    setState((){
      // ignore: deprecated_member_use
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage(){
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null){
          return const Text('Error picking image');
        } else{
          return const Text('No image selected');
        }
      },
    );
  }

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
          //   ElevatedButton(
          //     child: Text('New'),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => New()),
          //       );
          //     },
          //   ),
          //   ElevatedButton(
          //     child: Text('Location'),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Location()),
          //       );
          //     },
          //   ),
          showImage(),
          RaisedButton(
            child: Text('select from gallery'),
            onPressed: (){
              pickImageFromGallery(ImageSource.gallery);
            },
          ),
          MyDatePicker(),
          MyCustomForm(),
          Text('$post'),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            child: Text('save'),
            onPressed: () {
              post = [title, summary, location];
              Scaffold.of(context);
              print(post);
            },
          ),
        ],
      ),
    );
  }
}

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
              initialDate: _dateTime == null ? DateTime.now() : _dateTime,
              firstDate: DateTime(2010),
              lastDate: DateTime(2021),
            ).then((date) {
              setState(() {
                _dateTime = date;
              });
            });
          },
        ),
        Text('$_dateTime'),
      ],
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

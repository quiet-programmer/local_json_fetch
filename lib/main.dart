import 'package:flutter/material.dart';

import 'dart:convert';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal
    ),
    title: "Local JSON App",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local JSON"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('local_json_file/person.json'),
            builder: (context, snapshot) {
              // decode json here
              var mydata = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: ${mydata[index]['name']}"),
                        Text("Age: ${mydata[index]['age']}"),
                        Text("Height: ${mydata[index]['height']}"),
                        Text("Gender: ${mydata[index]['gender']}"),
                        Text("Hair: Color ${mydata[index]['hair_color']}"),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';

import 'package:alqurani/detailsurah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alqurani',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Alqurani'),
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
  Future loadInfo() async {
    var response = await rootBundle.loadString('surah/surah-info.json');
    if (response != null) {
      var data = json.decode(response);
      print(data);
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
              future: loadInfo(),
              builder: (c, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext c, int i) {
                          return Card(
                              elevation: 0.0,
                              child: ListTile(
                                title: Text(snapshot.data[i]['latin']),
                                subtitle: Text(snapshot.data[i]['translation']),
                                trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailSurah(
                                                  detail: snapshot.data[i]
                                                      ['latin'],
                                                  index: snapshot.data[i]
                                                      ['index'])));
                                    }),
                              ));
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            )));
  }
}

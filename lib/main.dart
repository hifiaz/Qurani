import 'dart:convert';

import 'package:alqurani/detailsurah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      body: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 80.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 200,
                      child: Card(
                        elevation: 0.0,
                        child: ListTile(
                          title: Text('Doa Harian'),
                          trailing: IconButton(
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: null,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: loadInfo(),
            builder: (c, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
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
          ),
        ],
      ),
      // bottomNavigationBar:
      //     BottomNavigationBar(elevation: 0.0, currentIndex: 0, items: [
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.home), title: Container(height: 0.0)),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.settings), title: Container(height: 0.0)),
      // ])
    );
  }
}

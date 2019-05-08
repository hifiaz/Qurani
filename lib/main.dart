import 'dart:convert';

import 'package:alqurani/detailasmaul.dart';
import 'package:alqurani/detaildoa.dart';
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
          scaffoldBackgroundColor: Color(0xffeaf0fe)),
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
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(colors: [
                        Color(0xff338b93),
                        Color(0xffb6f492),
                      ])),
                  width: 180,
                  child: ListTile(
                    title: Text(
                      'Doa Harian',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDoa()));
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(colors: [
                        Color(0xff338b93),
                        Color(0xffb6f492),
                      ])),
                  width: 180,
                  child: ListTile(
                    title: Text(
                      'Asmaul Husna',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailAsmaul()));
                      },
                    ),
                  ),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                              elevation: 0.0,
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          snapshot.data[i]['latin'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      subtitle: Text(
                                        snapshot.data[i]['translation'],
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.green),
                                      ),
                                      trailing: IconButton(
                                          icon:
                                              Icon(Icons.keyboard_arrow_right),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailSurah(
                                                            detail:
                                                                snapshot.data[i]
                                                                    ['latin'],
                                                            index: snapshot
                                                                    .data[i]
                                                                ['index'])));
                                          }),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Surat Ke',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[i]['index']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Ayat',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[i]['ayah_count']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Arabic',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[i]['arabic']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
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

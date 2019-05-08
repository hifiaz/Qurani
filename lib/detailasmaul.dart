import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DetailAsmaul extends StatefulWidget {
  @override
  _DetailAsmaulState createState() => _DetailAsmaulState();
}

class _DetailAsmaulState extends State<DetailAsmaul> {
  Future loadAsmaul() async {
    final response = await rootBundle.loadString('surah/asmaul-husna.json');
    if (response != null) {
      var res = json.decode(response);
      var data = res['data'];
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asmaul Husna'),
      ),
      body: FutureBuilder(
        future: loadAsmaul(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext c, int i) {
                    return Card(
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data[i]['arabic'],
                              style: TextStyle(fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(snapshot.data[i]['latin']),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              snapshot.data[i]['translation_id'],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

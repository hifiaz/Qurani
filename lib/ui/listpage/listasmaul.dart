import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pk_skeleton/pk_skeleton.dart';

class ListAsmaul extends StatefulWidget {
  @override
  _ListAsmaulState createState() => _ListAsmaulState();
}

class _ListAsmaulState extends State<ListAsmaul> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FutureBuilder(
          future: loadAsmaul(),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
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
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                : PKCardPageSkeleton(
                    totalLines: 5,
                  );
          },
        ),
      ),
    );
  }
}

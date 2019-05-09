import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DetailDoa extends StatefulWidget {
  @override
  _DetailDoaState createState() => _DetailDoaState();
}

class _DetailDoaState extends State<DetailDoa> {
  Future loadDoa() async {
    var response = await rootBundle.loadString('surah/doa-harian.json');
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
        title: Text('Doa Harian'),
      ),
      body: FutureBuilder(
        future: loadDoa(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext c, int i) {
                    return ExpansionTile(
                      title: Text(
                        snapshot.data[i]['title'],
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(18.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                snapshot.data[i]['arabic'],
                                style: TextStyle(fontSize: 24.0, height: 1.5),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['latin']),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['translation']),
                            ],
                          ),
                        )
                      ],
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

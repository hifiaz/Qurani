import 'dart:convert';

import 'package:alqurani/data/models/alldoa.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';

class ListDoa extends StatefulWidget {
  @override
  _ListDoaState createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
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
    var ui = Provider.of<UiState>(context);
    return Scaffold(
      body: FutureBuilder<List<AllDoa>>(
        future: ServiceData().loadDoa(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView(
                  children: snapshot.data
                      .map((du) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              elevation: 0.0,
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: ListTile(
                                  title: Text(du.title),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 10),
                                        child: Text(
                                          du.arabic,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: ui.fontSize,
                                              color: Colors.black),
                                        ),
                                      ),
                                      if (ui.terjemahan) Text(du.translation),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )
              : PKCardPageSkeleton(
                  totalLines: 5,
                );
        },
      ),
    );
  }
}

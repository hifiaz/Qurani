import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DetailSurah extends StatefulWidget {
  final detail, index;
  DetailSurah({Key key, @required this.detail, this.index}) : super(key: key);

  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  Future loadSurah() async {
    final response = await rootBundle.loadString('surah/${widget.index}.json');
    if (response != null) {
      var data = json.decode(response);
      var surah = data['${widget.index}'];
      print(surah);
      return surah;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.detail)),
      // body: Text('data'),
      body: FutureBuilder(
        future: loadSurah(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data['text'].length,
                  itemBuilder: (BuildContext c, int i) {
                    String key = snapshot.data['text'].keys.elementAt(i);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Text(snapshot.data['text'].keys.elementAt(i)),
                        title: Text(
                          snapshot.data['text'][key],
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 24.0),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            snapshot.data['translations']['id']['text'][key],
                            textAlign: TextAlign.end,
                          ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text('Next'),
        icon: Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:alqurani/data/models/allsurah.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSurah extends StatefulWidget {
  final detail, index;
  DetailSurah({Key key, @required this.detail, this.index}) : super(key: key);

  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.detail),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            )
          ],
        ),
        body: FutureBuilder<AllSurah>(
          future: ServiceData().loadSurah(widget.index),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data.text.length,
                    itemBuilder: (BuildContext c, int i) {
                      String key = snapshot.data.text.keys.elementAt(i);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Text(snapshot.data.text.keys.elementAt(i)),
                              title: Text(
                                '${snapshot.data.text[key]}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: ui.fontSize,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            if (ui.terjemahan)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AppStyle.spaceH10,
                                  Text(
                                    'Terjemah',
                                    style: AppStyle.end2subtitle,
                                  ),
                                  AppStyle.spaceH5,
                                  Text(
                                    snapshot.data.translations.id.text[key],
                                    style: TextStyle(
                                      fontSize: ui.fontSizetext,
                                    ),
                                  ),
                                ],
                              ),
                            if (ui.tafsir)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AppStyle.spaceH10,
                                  Text(
                                    'Tafsir Kemenag',
                                    style: AppStyle.end2subtitle,
                                  ),
                                  AppStyle.spaceH5,
                                  Text(
                                    snapshot.data.tafsir.id.kemenag.text[key],
                                    style: TextStyle(
                                      fontSize: ui.fontSizetext,
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

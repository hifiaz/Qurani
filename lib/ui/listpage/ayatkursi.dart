import 'package:alqurani/data/models/ayatkursi.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';

class AyatKursi extends StatefulWidget {
  @override
  _AyatKursiState createState() => _AyatKursiState();
}

class _AyatKursiState extends State<AyatKursi> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return FutureBuilder<AyathKursi>(
        future: ServiceData().loadAyatKursi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data.arabic,
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(height: 1.5, fontSize: ui.fontSize),
                          ),
                          AppStyle.spaceH10,
                          if (ui.terjemahan) Text(snapshot.data.translation),
                          if (ui.tafsir)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AppStyle.spaceH10,
                                Text(
                                  'Tafsir',
                                  style: AppStyle.end2subtitle,
                                ),
                                AppStyle.spaceH10,
                                Text(snapshot.data.tafsir),
                              ],
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return PKCardPageSkeleton(
            totalLines: 1,
          );
        });
  }
}

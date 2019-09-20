import 'package:alqurani/data/models/alldoa.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/ui/widget/carddoa.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';

class ListDoa extends StatefulWidget {
  @override
  _ListDoaState createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
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
                      .map((du) => CardDoa(
                            title: du.title,
                            arabic: du.arabic,
                            fontarabic: ui.fontSize,
                            terjemahan: ui.terjemahan,
                            translate: du.translation,
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

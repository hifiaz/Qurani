import 'package:alqurani/data/location.dart';
import 'package:alqurani/data/models/jadwalsholat.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  @override
  Widget build(BuildContext context) {
    var loc = Provider.of<LocationNotifier>(context);
    return FutureBuilder<JadwalDaily>(
        future: ServiceData().loadJadwalSholat(loc.location),
        builder: (c, snapshot) {
          if (snapshot.hasData)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '${snapshot.data.query}',
                              style: AppStyle.title,
                            ),
                            subtitle: Text(snapshot.data.country),
                            trailing: Text(
                              '${snapshot.data.todayWeather.temperature}°C',
                              style: TextStyle(fontSize: 40),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        trailing: Image.asset('images/subuh.png'),
                        title: Text('SUBUH'),
                        subtitle: Text(snapshot.data.items[0].fajr),
                      ),
                      ListTile(
                        trailing: Image.asset('images/terbit.png'),
                        title: Text('TERBIT'),
                        subtitle: Text(snapshot.data.items[0].shurooq),
                      ),
                      ListTile(
                        trailing: Image.asset('images/zuhur.png'),
                        title: Text('ZUHUR'),
                        subtitle: Text(snapshot.data.items[0].dhuhr),
                      ),
                      ListTile(
                        trailing: Image.asset('images/ashar.png'),
                        title: Text('ASAR'),
                        subtitle: Text(snapshot.data.items[0].asr),
                      ),
                      ListTile(
                        trailing: Image.asset('images/magrib.png'),
                        title: Text('MAGRIB'),
                        subtitle: Text(snapshot.data.items[0].maghrib),
                      ),
                      ListTile(
                        trailing: Image.asset('images/isya.png'),
                        title: Text('ISYA'),
                        subtitle: Text(snapshot.data.items[0].isha),
                      ),
                    ],
                  ),
                ],
              ),
            );
          return Center(child: CircularProgressIndicator());
        });
  }
}

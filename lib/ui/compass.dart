import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

import 'package:permission_handler/permission_handler.dart';

class Compass extends StatefulWidget {
  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  bool _hasPermissions = false;
  double _lastRead = 0;
  DateTime _lastReadAt;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    if (await Permission.locationWhenInUse.isGranted) {
      setState(() {
        _hasPermissions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Arah Kiblat'),
      ),
      body: Builder(builder: (context) {
        if (_hasPermissions) {
          return Column(
            children: <Widget>[
              _buildManualReader(),
              Expanded(child: _buildCompass()),
            ],
          );
        } else {
          return _buildPermissionSheet();
        }
      }),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          OutlineButton(
            child: Text('Lihat koordinat'),
            onPressed: () async {
              final double tmp = await FlutterCompass.events.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '$_lastRead',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  '${_lastReadAt ?? 'No Data'}',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<double>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return Center(
            child: Container(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(),
            ),
          );
        }

        double direction = snapshot.data;

        return Container(
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: ((direction ?? 0) * (math.pi / 180) * -1),
            child: Image.asset('images/compass.png'),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(),
          Text('Location Permission Required'),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlineButton(
              child: Text('Request Permissions'),
              onPressed: () async {
                await Permission.locationWhenInUse
                    .request()
                    .isGranted
                    .then((value) {
                  setState(() {
                    _hasPermissions = value;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

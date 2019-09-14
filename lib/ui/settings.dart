import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text('Settings'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Terjemahan'),
                  trailing: Switch(
                    value: ui.terjemahan,
                    onChanged: (newValue) => ui.terjemahan = newValue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Tafsir'),
                  trailing: Switch(
                    value: ui.tafsir,
                    onChanged: (newValue) => ui.tafsir = newValue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Card(
                elevation: 0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
                  title: Text('Arabic Font Size'),
                  subtitle: Slider(
                    min: 0.5,
                    value: ui.sliderFontSize,
                    onChanged: (newValue) => ui.fontSize = newValue,
                  ),
                  trailing: Text('${ui.fontSize.toInt()}'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                elevation: 0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
                  title: Text('Terjemahan Font Size',
                      style: AppStyle.end2subtitle),
                  trailing: Text('${ui.fontSizetext.toInt()}'),
                  subtitle: Slider(
                    min: 0.4,
                    value: ui.sliderFontSizetext,
                    onChanged: (newValue) => ui.fontSizetext = newValue,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

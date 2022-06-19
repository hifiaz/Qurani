import 'package:alqurani/data/utils/style.dart';
import 'package:flutter/material.dart';

class CardSurah extends StatelessWidget {
  CardSurah(
      {required this.title,
      required this.subtitle,
      required this.surah,
      required this.ayah,
      required this.arabic,
      required this.onTap});
  final String title, subtitle, surah, ayah, arabic;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  onTap: onTap,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      title,
                      style: AppStyle.title,
                    ),
                  ),
                  subtitle: Text(subtitle, style: AppStyle.subtitle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                AppStyle.spaceH5,
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Surat Ke', style: AppStyle.end2subtitle),
                          AppStyle.spaceH5,
                          Text(
                            surah,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Ayat', style: AppStyle.end2subtitle),
                          AppStyle.spaceH5,
                          Text(
                            ayah,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Arabic', style: AppStyle.end2subtitle),
                          AppStyle.spaceH5,
                          Text(
                            arabic,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

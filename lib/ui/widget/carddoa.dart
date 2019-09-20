import 'package:flutter/material.dart';

class CardDoa extends StatelessWidget {
  const CardDoa({
    Key key,
    @required this.title,
    @required this.arabic,
    @required this.fontarabic,
    @required this.terjemahan,
    @required this.translate,
  }) : super(key: key);

  final String title;
  final String arabic;
  final double fontarabic;
  final bool terjemahan;
  final String translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.all(12),
          child: ListTile(
            title: Text(title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  child: Text(
                    arabic,
                    textAlign: TextAlign.end,
                    style: TextStyle(height: 1.5, fontSize: fontarabic),
                  ),
                ),
                if (terjemahan) Text(translate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({
    Key key,
    @required this.title,
    @required this.leading,
  }) : super(key: key);

  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        elevation: 0,
        child: ListTile(title: Text(title), trailing: leading),
      ),
    );
  }
}

import 'package:alqurani/data/utils/style.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  ListCard({this.title, this.ontap});
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: AppStyle.mainGradient),
      width: 180,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onPressed: ontap,
        ),
      ),
    );
  }
}

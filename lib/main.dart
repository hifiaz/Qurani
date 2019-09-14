import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/ui/about.dart';
import 'package:alqurani/ui/home.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => UiState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alqurani',
        theme: ThemeData(
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: Color(0xffeaf0fe)),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/settings': (context) => Settings(),
          '/about': (context) => About(),
        },
      ),
    );
  }
}

import 'package:alqurani/data/themes.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/ui/about.dart';
import 'package:alqurani/ui/home.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_) => UiState()),
      ChangeNotifierProvider(builder: (_) => ThemeNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alqurani',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
      },
    );
  }
}

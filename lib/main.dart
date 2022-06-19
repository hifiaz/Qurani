import 'package:alqurani/data/location.dart';
import 'package:alqurani/data/themes.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/ui/about.dart';
import 'package:alqurani/ui/compass.dart';
import 'package:alqurani/ui/home.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  // Initialize without device test ids.
  MobileAds.instance.initialize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UiState()),
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => LocationNotifier()),
  ], child: MyApp()));
}

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
        '/kiblah': (context) => Compass(),
      },
    );
  }
}

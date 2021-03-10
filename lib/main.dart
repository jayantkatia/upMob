import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upcoming_mobiles_frontend/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Mobiles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.orangeAccent,
          scaffoldBackgroundColor: Colors.grey[100],
          brightness: Brightness.light,
          fontFamily: 'GoogleSans',
          textTheme: TextTheme().copyWith(
              headline6: TextTheme().headline6?.copyWith(fontSize: 18))),
      home: MyHomePage(),
    );
  }
}

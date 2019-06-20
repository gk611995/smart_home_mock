    import 'package:flutter/material.dart';
import 'package:smart_home/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
       primaryColor: Color(0xff3f3d49),
        backgroundColor: Color(0xff2d2b37),
        // accentColor: Colors.white,
        // primaryColor: Colors.white,
        // backgroundColor: Colors.white54
       // primarySwatch: Color(0xff3f3d49),
      ),
      home: HomeScreen(),
    );
  }
}

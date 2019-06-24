    import 'package:flutter/material.dart';
import 'package:smart_home/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget  {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: darkTheme,
      home: HomeScreen(),
    );
  }
}



  final ThemeData lightTheme = ThemeData(

         primaryColor: Colors.white,
        backgroundColor:Color(0xffE1E1EA),
        textTheme: Typography.blackCupertino
      );
final ThemeData darkTheme =ThemeData(
       primaryColor: Color(0xff3f3d49),
       backgroundColor: Color(0xff2d2b37),
        textTheme: Typography.whiteCupertino
);

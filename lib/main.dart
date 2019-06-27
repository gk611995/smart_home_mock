import 'package:flutter/material.dart';
import 'package:smart_home/screens/home.dart';
import 'package:smart_home/themes/themes.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final ThemeBloc themeBloc = ThemeBloc();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ThemeData>(
//         initialData: themeBloc.initialTheme().data,
//         stream: themeBloc.themeDataStream,
//         builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
//           return MaterialApp(
//             title: 'Smart Home',
//             home: HomeScreen( themeBloc: themeBloc),
//           );
//         });
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppAppState createState() => _MyAppAppState();
}

class _MyAppAppState extends State<MyApp> {
  ThemeBloc _themeBloc;

  @override
  void initState() {
    super.initState();
    _themeBloc = ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      initialData: _themeBloc.initialTheme().data,
      stream: _themeBloc.themeDataStream,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        return MaterialApp(
          title: 'Theme Switcher',
          theme: snapshot.data,
          home: HomeScreen(
            themeBloc: _themeBloc,
          ),
        );
      },
    );
  }
}

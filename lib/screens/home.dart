import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  //name({Key key, this.child}) : super(key: key);
  final ThemeBloc themeBloc;

  HomeScreen({Key key, this.themeBloc}) : super(key: key);
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Color(0xffE1E1EA),
      textTheme: Typography.whiteCupertino);
  final ThemeData darkTheme = ThemeData(
      primaryColor: Color(0xff3f3d49),
      backgroundColor: Color(0xff2d2b37),
      textTheme: Typography.blackCupertino);
  final icons = [
    Icons.lightbulb_outline,
    Icons.kitchen,
    Icons.speaker,
    Icons.scanner,
    Icons.watch,
    Icons.router
  ];
  final deviceState = [false, false, false, false, false, false];
  final listIcons = [
    Icons.wb_iridescent,
    Icons.local_hotel,
    Icons.satellite,
    Icons.snooze,
    Icons.ac_unit,
    Icons.opacity,
    Icons.language
  ];
  final iconColors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.cyanAccent,
    Colors.yellowAccent,
    Colors.pink,
    Colors.amberAccent
  ];
  bool isbuttonpressed = true;
  final titles = [
    'Light',
    'Refrigerator',
    'Speakers',
    'Scanner',
    'Watch',
    'Router'
  ];
  final iconPressed = [false, false, false, false, false, false];
  bool pressed = true;
  bool control = true;
  List<double> valuearray = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  String dropdownValue = 'Light';

  double _value = 0.0;
  _setslidervalue(double value, index) =>
      setState(() => valuearray[index] = value);

  void _setvalue(double value) => setState(() => _value = value);

  togglebutton() {
    setState(() {
      this.isbuttonpressed = !this.isbuttonpressed;
      print(this.isbuttonpressed);
    });
  }

  List<Widget> getlist() {
    return List.generate(6, (index) {
      return ButtonTheme(
          height: 30.0,
          minWidth: 1.0,
          child: FlatButton(
              color: iconPressed[index]
                  ? Theme.of(context).primaryColor
                  : iconColors[index],
              child: Icon(
                listIcons[index],
                color: iconPressed[index] ? Colors.grey : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  iconPressed[index] = !iconPressed[index];
                });
              },
              shape: CircleBorder(side: BorderSide(color: Colors.grey))));
    });
  }

  DemoTheme _buildLightTheme() {
    return DemoTheme(
        'light',
        ThemeData(
            primaryColor: Colors.white,
            backgroundColor: Color(0xffE1E1EA),
            accentColor: Color(0xff0B0A0F),
            textTheme: Typography.blackCupertino));
  }

  DemoTheme _buildDarkTheme() {
    return DemoTheme(
        'dark',
        ThemeData(
            primaryColor: Color(0xff3f3d49),
            backgroundColor: Color(0xff2d2b37),
            accentColor: Colors.white,
            textTheme: Typography.whiteCupertino));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Home Control"),
          actions: <Widget>[
            // Switch(
            //   onChanged: ,
            // )
            DropdownButton<String>(
              icon: Icon(Icons.settings),
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  print("theme switch");
                  dropdownValue = newValue;
                  (newValue == 'Light')
                      ? this
                          .widget
                          .themeBloc
                          .selectedTheme
                          .add(_buildLightTheme())
                      : this
                          .widget
                          .themeBloc
                          .selectedTheme
                          .add(_buildDarkTheme());
                });
              },
              items: <String>['Light', 'Dark']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(6, 12, 6, 6),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'General Control',
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            activeColor: Colors.yellowAccent,
                            value: control,
                            onChanged: (value) {
                              setState(() {
                                control = !value;
                              });
                            },
                          ),
                        ))
                      ],
                    ))), //ro
            Padding(
                padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.computer,
                                size: 64,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'TV',
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Center(
                                      child: new Text(
                                        _value.round().toString() + "%",
                                        //style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Material(
                                      color: Theme.of(context).primaryColor,
                                      child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Slider(
                                              activeColor: Colors.blue,
                                              inactiveColor: Colors.grey,
                                              min: 0,
                                              max: 100,
                                              value: _value,
                                              onChanged: _setvalue)))
                                ])
                          ],
                        ),
                        Row(children: getlist())
                      ],
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
                child: new GridView.count(
                  primary: false,
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(6, (index) {
                    return Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Theme.of(context).primaryColor,
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      ButtonTheme(
                                          height: 30.0,
                                          minWidth: 50.0,
                                          child: FlatButton(
                                            // color: deviceState[index]
                                            //     ? Theme.of(context).primaryColor
                                            //     : Colors.blue,
                                            child: Icon(
                                              icons[index],
                                              color: deviceState[index]
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : Colors.yellowAccent,
                                              size: 42.0,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                deviceState[index] =
                                                    !deviceState[index];
                                              });
                                            },
                                            // shape: CircleBorder(side: BorderSide(color: Colors.grey)
                                            // )
                                          )),
                                      Container(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: new Center(
                                          child: new Text(
                                            valuearray[index]
                                                    .round()
                                                    .toString() +
                                                "%",
                                            // style: TextStyle(
                                            //     color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ]),
                                // new Center(
                                //   child:
                                //       Icon(icons[index], color: Colors.white),
                                // ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Center(
                                    child: new Text(
                                      titles[index],
                                      //style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                                Material(
                                    color: Theme.of(context).primaryColor,
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Slider(
                                          min: 0,
                                          max: 100,
                                          activeColor: Colors.blue,
                                          inactiveColor: Colors.grey,
                                          value: valuearray[index],
                                          onChanged: (double value) =>
                                              _setslidervalue(value, index),
                                        )))
                              ],
                            ))); //robohash.org api provide you different images for any number you are giving
                  }),
                ))
          ],
        ));
  }
}

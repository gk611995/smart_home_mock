import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  //name({Key key, this.child}) : super(key: key);

  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final icons = [
    Icons.lightbulb_outline,
    Icons.kitchen,
    Icons.speaker,
    Icons.scanner,
    Icons.watch,
    Icons.router
  ];
  final listIcons =[
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
                  :iconColors[index],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Home Control"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding:  EdgeInsets.fromLTRB(6,12,6,6),
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
                              style: TextStyle(color: Colors.white),
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
                padding:  EdgeInsets.fromLTRB(6,0,6,6),
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
                                color: Colors.white,
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                  child:Text(
                                    'TV',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  ),
                                                Container(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: new Center(
                                    child: new Text(
                                      _value.round().toString() +"%",
                                      style: TextStyle(color: Colors.white),
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
                                              onChanged: _setvalue
                                              )))
                                ])
                          ],
                        ),
                        Row(children: getlist())
 
                      ],
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(6,0,6,6),
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
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ) ,
                            color: Theme.of(context).primaryColor,
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Center(
                                  child:
                                      Icon(icons[index], color: Colors.white),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Center(
                                    child: new Text(
                                      titles[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                                                Container(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: new Center(
                                    child: new Text(
                                      valuearray[index].round().toString() +"%",
                                      style: TextStyle(color: Colors.white),
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

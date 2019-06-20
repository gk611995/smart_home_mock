import 'dart:async';
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
  bool isbuttonpressed = true;
  final titles = [
    'Light',
    'Refrigerator',
    'Speakers',
    'Scanner',
    'Watch',
    'Router'
  ];
  bool pressed = true;
  bool control = true;
  List<double> _valuearray = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  double _value = 0.0;
  _setslidervalue(double value, index) =>
      setState(() => _valuearray[index] = value);

  void _setvalue(double value) => setState(() => _value = value);

  togglebutton() {
    setState(() {
      this.isbuttonpressed = !this.isbuttonpressed;
      print(this.isbuttonpressed);
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
                padding: EdgeInsets.all(6.0),
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
                                control= !value;
                              });
                            },
                          ),
                        ))
                      ],
                    ))), //ro
            Padding(
                padding: EdgeInsets.all(6.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 3,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
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
                                  Text(
                                    'Test',
                                    style: TextStyle(color: Colors.white),
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
                                              //                onChanged: (double newValue) {
                                              //   setState(() {
                                              //     _value = newValue.round().toDouble();
                                              //   });
                                              // },
                                              )))
                                ])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                child:  FlatButton(
                                    //borderSide: BorderSide(color: Colors.grey),
                                    //borderSide: BorderSide(color: Colors.grey),
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.deepOrangeAccent,
                                    child: Icon(
                                      Icons.battery_charging_full,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                // buttonColor: Colors.red,
                                child: FlatButton(
                                    //borderSide: BorderSide(color: Colors.grey),
                                    //borderSide: BorderSide(color: Colors.grey),
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.pinkAccent,
                                    child: Icon(
                                      Icons.nature,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                child: FlatButton(
                                    //borderSide: BorderSide(color: Colors.grey),
                                    //borderSide: BorderSide(color: Colors.grey),
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.greenAccent,
                                    child: Icon(
                                      Icons.timelapse,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                child: FlatButton(
                                    //borderSide: BorderSide(color: Colors.grey),
                                    //borderSide: BorderSide(color: Colors.grey),
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.blueGrey,
                                    child: Icon(
                                      Icons.gamepad,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                child: FlatButton(
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.indigo,
                                    child: Icon(
                                      Icons.flare,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                       setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 1.0,
                                child:  FlatButton(
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.blueAccent,
                                    child: Icon(
                                      Icons.local_florist,
                                      color:
                                          pressed ? Colors.grey : Colors.white,
                                    ),
                                    onPressed: () {
                                       setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    shape: CircleBorder(
                                        side: BorderSide(color: Colors.grey)))),
                          ],
                        )
                      ],
                    ))),
            Container(
                padding: EdgeInsets.all(6),
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
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: new Center(
                                    child: new Text(
                                      titles[index],
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
                                          value: _valuearray[index],
                                          onChanged: (double value) =>
                                              _setslidervalue(value, index),
                                        )))
                              ],
                            ))); //robohash.org api provide you different images for any number you are giving
                  }),
                  // return new GridTile(
                  //   child:

                  //    new Card(
                  //     color: Colors.blue.shade200,
                  //     child: new Center(
                  //       child: new Text('tile $index'),
                  //     )
                  //   ),
                  // );
                ))
          ],
        ));
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            itemCount: 4,
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}

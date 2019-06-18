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
  bool isbuttonpressed= true;
  final titles = [
    'Light',
    'Refrigerator',
    'Speakers',
    'Scanner',
    'Watch',
    'Router'
  ];

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
                padding: EdgeInsets.all(2.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'General Control',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: true,
                          ),
                        ))
                      ],
                    ))), //ro
            Padding(
                padding: EdgeInsets.all(2.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  Container(
                                      alignment: Alignment.centerRight,
                                      child: Slider(
                                        min: 0,
                                        max: 40,
                                        value: 20,
                                      ))
                                ])
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 20.0,
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.wb_iridescent,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder())),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 50.0,
                               // buttonColor: Colors.red,
                                child: OutlineButton(
                                    splashColor: Colors.green,
                                    highlightColor: Colors.blue,
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.blue,
                                    child: Icon(
                                      Icons.filter_drama,
                                      color: Colors.grey,
                                    ),
                                  onPressed:() => togglebutton(),

                                    shape: CircleBorder())),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 10.0,
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.grain,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder())),
                            ButtonTheme(
                                height: 30.0,
                                minWidth: 20.0,
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.timelapse,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder())),
                                                                ButtonTheme(
                                height: 30.0,
                                minWidth: 20.0,
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.flare,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder())),
                                                                ButtonTheme(
                                height: 30.0,
                                minWidth: 20.0,
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.grey),
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.space_bar,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder())),
                          ],
                        )
                      ],
                    ))),
            Container(
                padding: EdgeInsets.all(16),
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
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Slider(
                                      min: 0,
                                      max: 40,
                                      value: 20,
                                    ))
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

    // body:  ListView(
    //       scrollDirection: Axis.horizontal,
    //       children: <Widget>[
    //         _buildCarouselItem()
    //         Container(
    //           width: 160.0,
    //           color: Colors.red,
    //         ),
    //         Container(
    //           width: 160.0,
    //           color: Colors.blue,
    //         ),
    //         Container(
    //           width: 160.0,
    //           color: Colors.green,
    //         ),
    //         Container(
    //           width: 160.0,
    //           color: Colors.yellow,
    //         ),
    //         Container(
    //           width: 160.0,
    //           color: Colors.orange,
    //         ),
    //       ],
    //     ),
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

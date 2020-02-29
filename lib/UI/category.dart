import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';


//import 'package:tabbar/tabbar.dart';
class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int count = 1;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 1, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/gamepad.png',
                  fit: BoxFit.contain,
                  height: 25,
                ),
                Text(
                  '  Gaming & Entertaiment',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            actions: [
              new IconButton(
                icon: new Icon(Icons.shopping_cart),
                tooltip: 'cart',
                onPressed: () async {
                  null;
                },
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.blue[700],
                    Colors.blue[900],
                  ],
                ),
              ),
            ),
            bottom: new PreferredSize(
              child: Container(
                color: Colors.blue[300],
                height: 60,
                child: TabBar(controller: controller, tabs: <Tab>[
                  new Tab(child: new Image.asset('assets/ps.png')),
                  
                ],),
              ),
              preferredSize: Size.fromHeight(55.0),
            )),
        body: new TabBarView(controller: controller, children: <Widget>[
          Container(
            color: Colors.blue[900],
            child: ListView(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      '  Play Station Store cards',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.green[100],
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: 600.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 8,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              'assets/store.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Row(
                            children: <Widget>[
                              new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new Column(
                                  children: <Widget>[
                                    Text(
                                      '12\$ card',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    Text("play station card ")
                                  ],
                                ),
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(left: 40.0),
                                child: new Row(children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      count != 0
                                          ? new IconButton(
                                              icon: new Icon(Icons.remove),
                                              onPressed: () =>
                                                  setState(() => count--),
                                            )
                                          : new Container(),
                                      new Text(count.toString()),
                                      new IconButton(
                                          icon: new Icon(Icons.add),
                                          onPressed: () =>
                                              setState(() => count++))
                                    ],
                                  ),
                                ]),
                              ),
                            ],
                          )),
                      new Padding(
                        padding: new EdgeInsets.all(2.0),
                        child: new Row(
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.all(15.0),
                              child: new Text(
                                '19000 L.L',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: new EdgeInsets.only(left: 15),
                              child: RaisedButton(
                                onPressed: () {},
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 5),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                        Colors.green,
                                        Colors.greenAccent
                                      ])),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.add_shopping_cart,
                                          color: Colors.black),
                                      Text("ADD TO CART ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ]),
          ),
        ]));
  }
}

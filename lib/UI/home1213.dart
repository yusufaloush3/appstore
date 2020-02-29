import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:xgeeks_app/UI/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../sginincon.dart';
import 'SignIn.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
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
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 25,
            ),
          ],
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            color: Colors.greenAccent,
            tooltip: 'cart',
            onPressed: () => print("cart"),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.blue,
                Colors.blue[900],
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
     
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blue,
              Colors.blue[900],
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.blue[900],
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset('assets/gamepad.png', width: 25),
                    Text(
                      '  Gaming & Entertaiment',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ]),
            ),
            Container(
                height: 118,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Gaming & Entertainment")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xffe68200),
                          ),
                        ));
                      }

                      if (snapshot.data.documents.length == 0) {
                        return Center(child: Container());
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(right: 1, left: 1, top: 8),
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds =
                                    snapshot.data.documents[index];
                                return Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 25, right: 25),
                                  child: Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Category()),
                                            );
                                          },
                                          child: Image.network(
                                            ds["imageurl"],
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                            ),
                          ),
                        );
                      }
                    })),
            Container(
              color: Colors.blue[900],
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset('assets/appstore.png', width: 25),
                    Text(
                      '  App store',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ]),
            ),
            Container(
                height: 118,
                child: StreamBuilder(
                    stream:
                        Firestore.instance.collection("App Store").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xffe68200),
                          ),
                        ));
                      }

                      if (snapshot.data.documents.length == 0) {
                        return Center(child: Container());
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(right: 1, left: 1, top: 8),
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds =
                                    snapshot.data.documents[index];
                                return Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 25, right: 25),
                                  child: Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Category()),
                                            );
                                          },
                                          child: Image.network(
                                            ds["imageurl"],
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                            ),
                          ),
                        );
                      }
                    })),
            Container(
              color: Colors.blue[900],
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset('assets/google-play-icon.png', width: 25),
                    Text(
                      '  Google play',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ]),
            ),
            Container(
                height: 118,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("google play")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xffe68200),
                          ),
                        ));
                      }

                      if (snapshot.data.documents.length == 0) {
                        return Center(child: Container());
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(right: 1, left: 1, top: 8),
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds =
                                    snapshot.data.documents[index];
                                return Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 25, right: 25),
                                  child: Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Category()),
                                            );
                                          },
                                          child: Image.network(
                                            ds["imageurl"],
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                            ),
                          ),
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}

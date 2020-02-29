import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:xgeeks_app/UI/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> subcatimages = new List();
  List<String> subcatnames = new List();

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
              height: 30,
            ),
          ],
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
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
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
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
              child: StreamBuilder(
                  stream: Firestore.instance.collection("categories").snapshots(),
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
                        padding: EdgeInsets.only(right: 1, left: 1, top: 30),
                        child: Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot ds =
                                  snapshot.data.documents[index];
                              subcatimages = List.from(
                                  ds.data['sub_categories_image_url']);
                              subcatnames =
                                  List.from(ds.data['sub_categories_name']);
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.blue[900],
                                      height: 65,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(
                                              ds["category_image"],
                                              width: 60,
                                            ),
                                            Text(
                                              " " + ds["category_name"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ]),
                                    ),
                                    Container(
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
                                      height: 300,
                                      child: GridView.builder(
                                        itemCount: subcatimages.length,
                                        scrollDirection:  Axis.vertical,
                                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Center(
                                              child: GestureDetector(
                                            onTap: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Category()),
                                              );
                                            },
                                            child: Image.network(
                                              subcatimages[index],
                                              width: 60,
                                            ),
                                          ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                       );
                    }
                  })),
        ],
      ),
    );
  }

}

import 'dart:async';

import 'package:flutter/material.dart';
import 'signin.dart'; 
import '../src/app.dart';

class SplashView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
       debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) => new _SplashContent(),
        ),
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => new Signin()}
    );
  }
}

class _SplashContent extends StatefulWidget{

  @override
  _SplashContentState createState() => new _SplashContentState();
}

class _SplashContentState extends State<_SplashContent>
    with SingleTickerProviderStateMixin {

  var _iconAnimationController;
  var _iconAnimation;

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pushReplacementNamed(context, "/main");
  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 3000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
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
        
       child:Center(
        child: new Image(
          image: new AssetImage("assets/x-logo.png"),
          width: _iconAnimation.value * 100,
          height: _iconAnimation.value * 100,
        )
    )
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:xgeeks_app/UI/SignUp.dart';
import 'package:xgeeks_app/widgets/face_icon_icons.dart';
import 'home.dart';

import '../sginincon.dart';



class Signin extends StatefulWidget {
  @override
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String loginEmail;
  String loginPassword;

  Future<void> checkUser() async{
    FirebaseUser user = await _auth.currentUser();
    if(user != null){
       Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
    }
  }

  @override
  void initState() { 
    checkUser();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue[900], Colors.blue[700]]),
          ),
          child:ListView(
           children :<Widget>[
           Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 8, top:30),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.13,
                    height: MediaQuery.of(context).size.height / 1.5,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20 , top:20),
                      child: ListView(
                        children: <Widget>[
                          Text('Email Address',style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Container(
                                color: Color(0xfff5f5f5),
                                child: Container(
                                  height: 50,
                                  child: TextField(
                                    onChanged: (v){
                                      loginEmail = v;
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'),
                                    decoration: InputDecoration.collapsed(
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      hintText: '  e.g : xgeeks@gmail.com',
                                    ),
                                  ),
                                )),
                          ),
                          Text('Password',style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                          padding:  EdgeInsets.fromLTRB(2, 10, 0, 0),
                            child: Container(
                                height: 50,
                                color: Color(0xfff5f5f5),
                                child: Container(
                                  child: TextFormField(
                                    onChanged: (v){
                                      loginPassword = v;
                                    },
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'),
                                    decoration: InputDecoration.collapsed(
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      hintText: '  *********',
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 12, left: 70, right: 70),
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green[100],
                                      Colors.green[400]
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                 child: GestureDetector(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 350.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN IN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey[400]),
                                    
                                  ),

                                ),
                                       onTap: ()async {
                                         if(loginPassword.trim().length>0&&loginEmail.trim().length>0){
                                         await _auth.signInWithEmailAndPassword(email: loginEmail, password: loginPassword);
                                          FirebaseUser user = await _auth.currentUser();
                                         if( user.isEmailVerified){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
                                         }
                                         else{
                                           user.sendEmailVerification();
                                         }

                                         }

}
                                 ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Row(children: <Widget>[
                              Expanded(child: Divider()),
                              Text(" or "),
                              Expanded(child: Divider()),
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 30, right: 30),
                            child: googleloginbutton(),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 30, right: 30),
                            child: fbloginbutton(),
                          )
                        ],
                      ),
                    ),
                  ),
                  signUpTextRow(),
                  SizedBox(
                    height: 10,
                  ),
                  skipTextRow(),
                ],
              ),
            ),
          )
           ]
          ),
          ),

    );
  }

  Widget googleloginbutton() {
    return SignInButton(
      Buttons.Google,
      text: "Sign in with Google",
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ),
          );
        });
      },
    );
  }

  Widget fbloginbutton() {
    return SignInButtonBuilder(
      text: 'Sign in with facebook',
      icon: FaceIcon.facebook_circled,
     onPressed: () {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => FB()),
  // );
},
      backgroundColor: Colors.blue[900],
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.grey[600], fontSize: 13),
          ),
          SizedBox(
            height: 3,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => signup()),
              );
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[500],
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget skipTextRow() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text(
              " Skip SIGN IN",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[600],
                  fontSize: 14),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          GestureDetector(
            onTap: () {
              print("signup with google account");
            },
            child: Text(
              "(Enter as guest)",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600],
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

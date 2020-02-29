

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:xgeeks_app/UI/SignIn.dart';
import 'package:xgeeks_app/widgets/face_icon_icons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../src/app.dart';
import 'home.dart';

class signup extends StatefulWidget {
  @override
  signupState createState() => signupState();
}

class signupState extends State<signup> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  String phoneNo;



  @override
  void initState() { 
    
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: 
      Container(
       
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient:
            LinearGradient(colors: [Colors.blue[900], Colors.blue[700]]),
          ),
          child:  ListView(
        children : <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 1),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only ( top: 20 , bottom: 8),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 1.25,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20 , top:20),
                      child: ListView(
                        children: <Widget>[
                          Text('Full Name',style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                            child: Container(
                                color: Color(0xfff5f5f5),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'),
                                    decoration: InputDecoration.collapsed(
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      hintText: '  e.g : jone',
                                    ),
                                  ),
                                )),
                          ),
                          Text('Email Address',style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Container(
                                color: Color(0xfff5f5f5),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    onChanged: (v){
                                      email = v;
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
                            padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                                height: 40,
                                color: Color(0xfff5f5f5),
                                child: Container(
                                  child: TextFormField(
                                    onChanged: (v){
                                      password = v;
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
                          SizedBox(
                          height:20
                          ),
                            Container(
                                height: 40,
                                color: Color(0xfff5f5f5),
                                
                          child:InternationalPhoneNumberInput(
                            initialCountry2LetterCode: 'LB',
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                              this.phoneNo = number.phoneNumber;
                            },
                            isEnabled: true,
                            autoValidate: true,
                            formatInput: true,
                          ),
                                
                                ),
                          Padding(
                            padding:
                            EdgeInsets.only(top: 20, left: 60, right: 60),
                            child: RaisedButton(
                              onPressed: () async{

                                if(email.trim().length>0&&password.trim().length>0){
                                await _auth.createUserWithEmailAndPassword(email: email, password: password);    
                              }
                              },
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
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN UP",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20 ),
                            child: Row(children: <Widget>[
                              Expanded(child: Divider()),
                              Text(" or "),
                              Expanded(child: Divider()),
                            ]),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(top: 5, left: 30, right: 30),
                            child: googleloginbutton(),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(top: 5, left: 30, right: 30),
                            child: fbloginbutton(),
                          )
                        ],
                      ),
                    ),
                  ),
                  signUpTextRow(),

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
    // _handleSignIn().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
    // }
    // );
  },
    );
  }

  Widget fbloginbutton() {
    return SignInButtonBuilder(
      text: 'Sign in with facebook',
      icon: FaceIcon.facebook_circled,
      onPressed: () async {},
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
            "Already have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 13),
          ),
          SizedBox(
            height: 3,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signin()),
              );
            },
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }


}

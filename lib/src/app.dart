import 'package:flutter/material.dart';
import 'auth_bloc_provider.dart';
import 'auth_screen.dart';

class PasswordlessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthBlocProvider(
      
      child: MaterialApp(
        
        theme: ThemeData(
          accentColor: Colors.teal,
          primaryColor: Colors.blue,
        ),
         debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AuthScreen(),
        ),
      ),
    );
  }
}

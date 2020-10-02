import 'package:chat_app/all_users_screen.dart';
import 'package:chat_app/home_page.dart';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoggedIn = false;

  void isSignedIn() async {
    if (await googleSignIn.isSignedIn()) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(primarySwatch: Colors.red),
      // routes: <String, WidgetBuilder>{
      //   '/chatscreen': (BuildContext context) => new AllUsersScreen(),
      // },
      routes: {
//        SplashScreen.id: (context) => SplashScreen(),
        AllUsersScreen.id: (context) => AllUsersScreen(),
        HomePage.id: (context) => HomePage(),
        // RegistrationScreen.id: (context) => RegistrationScreen(),
        // MyHomePage.id: (context) => MyHomePage(),
        // NotificationScreen.id: (context) => NotificationScreen(),
        // AboutPage.id: (context) => AboutPage(),
        // //Search User Screen
        // SeachAppBarRecipe.id: (context) => SeachAppBarRecipe(),
      },
      home: isLoggedIn == true ? AllUsersScreen() : HomePage(),
    );
  }
}

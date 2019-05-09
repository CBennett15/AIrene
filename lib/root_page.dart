import 'package:flutter/material.dart';
import 'login.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => new _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        // authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LogIn(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new Container(
          child: new Text("Welcome"),
        );
    }
  }
}
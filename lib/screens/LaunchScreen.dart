import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:trove_challenge/screens/SignIn/OnBoardingPage.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new OnBoardingPage(),
        title: Text(
          'BBLoan App Demo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print('BBLoan App Demo'),
        loaderColor: Colors.green);
  }
}

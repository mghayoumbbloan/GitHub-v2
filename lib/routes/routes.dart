import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trove_challenge/screens/HistoryPage/HistoryPage.dart';
import 'package:trove_challenge/screens/Home/Home.dart';
import 'package:trove_challenge/screens/LaunchScreen.dart';
import 'package:trove_challenge/screens/Profile/Profile.dart';
import 'package:trove_challenge/screens/RequestLoan/RequestLoan.dart';
import 'package:trove_challenge/screens/LoanRoom/LoanRoom.dart';
import 'package:trove_challenge/screens/SignIn/SignIn.dart';
import 'package:trove_challenge/screens/SignUp/SignUp.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: LaunchScreen());
      case '/walkthrough':
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      case '/signin':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: SignIn());
      case '/signup':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: SignUp());
      case '/history':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: HistoryPage());
      case '/profile':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: Profile());
      case '/messages':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: Profile());
      case '/requestloan':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: RequestLoan());
      case '/loanroom':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: LoanRoom());
      case '/home':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: Home());
      case '/logout':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: SignIn());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}

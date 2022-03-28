import 'package:flutter/material.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key, @required this.theme, @required this.index})
      : super(key: key);

  final ThemeUtils theme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        color: Color(0xfff1f1f1),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: Opacity(
                    opacity: index == 0 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.home,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('Home',
                          style: TextStyle(
                              color: Color(0xff1f3c88),
                              //
                              fontSize: 14))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/history');
                  },
                  child: Opacity(
                    opacity: index == 1 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.history,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('History',
                          style:
                              TextStyle(color: Color(0xff1f3c88), fontSize: 14))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/loanroom');
                  },
                  child: Opacity(
                    opacity: index == 1 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.house,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('LoanRoom',
                          style:
                          TextStyle(color: Color(0xff1f3c88), fontSize: 14))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/requestloan');
                  },
                  child: Opacity(
                    opacity: index == 2 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.add_circle,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('Loan',
                          style:
                              TextStyle(color: Color(0xff1f3c88), fontSize: 14))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/messages');
                  },
                  child: Opacity(
                    opacity: index == 3 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.message,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('Messages',
                          style:
                          TextStyle(color: Color(0xff1f3c88), fontSize: 14))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: Opacity(
                    opacity: index == 3 ? 1 : .3,
                    child: Column(children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.person_outline,
                              size: 30, color: Color(0xff1f3c88))),
                      Text('Profile',
                          style:
                              TextStyle(color: Color(0xff1f3c88), fontSize: 14))
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

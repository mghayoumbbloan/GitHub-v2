import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trove_challenge/constants/Constants.dart';

class Common {
  static Widget title(context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'L',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Constants.balanceCard, //Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'oa',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'n',
              style: TextStyle(
                // color: Color(0xffe46b10),
                color: Constants.balanceCard,
                fontSize: 30,
              ),
            ),
          ]),
    );
  }

  static Widget backButton(context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  static Widget Loader({height, width}) => Container(
        child: SizedBox(
          height: width ?? 25.0,
          width: height ?? 25.0,
          child: CircularProgressIndicator(),
        ),
      );
}

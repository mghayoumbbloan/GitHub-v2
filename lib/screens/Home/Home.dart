import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/provider/User.dart';
import 'package:trove_challenge/utils/SizeConfig.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';
import 'package:trove_challenge/widgets/BottomNavBar/BottomNavBar.dart';
import 'package:trove_challenge/widgets/PortfolioPosition/PortfolioPosition.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ThemeUtils theme = new ThemeUtils();
  UserProvider _user;
  final formatCurrency = new NumberFormat.currency(locale: "en_US", symbol: "");

  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: 100,
      width: _media.width / 2 - 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$ ${formatCurrency.format(amount)}",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _user = Provider.of<UserProvider>(context);
    print(_user.getUser.fullName);
    print(_user.getUser.phoneNumber);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.4, 0.0),
              stops: [0.2, 0.7],
              colors: [Constants.bgColorGradient1, Constants.bgColorGradient2],
            ),
          ),
          child: Stack(children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome,',
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: SizeConfig.blockSizeHorizontal * 4.6,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/logout');
                              },
                              child: Icon(Icons.logout,
                                  color: Colors.white, size: 26),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/profile');
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                    image: AssetImage(_user.getUser.image),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                  Row(children: [
                    Text(_user.getUser.fullName,
                        //"Moronfoluwa A.",
                        style: TextStyle(
                            color: Colors.white,
                            // fontSize: 28,
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            fontWeight: FontWeight.w500)),
                  ]),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(children: [
                    /// BALANCE
                    Row(
                      children: <Widget>[
                        colorCard("Available credit", 10000.0, 1, context,
                            Constants.balanceCard),
                        colorCard("Active Loan Balance", 20500.0, -1, context,
                            Constants.activeCard),
                      ],
                    ),

                    /// Portfolio Positions
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Loan Positions',
                              style: TextStyle(
                                color: Constants.bgColor,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeHorizontal * 6,
                              )),
                        ],
                      ),
                    ),

                    /// Stocks
                    Column(
                      children: [
                        PortfolioPosition(
                            theme: theme,
                            image: Icons.stacked_bar_chart,
                            symbol: "user 1",
                            totalQuantity: 4,
                            equityValue: 250.0,
                            pricePerShare: 125.0),
                        PortfolioPosition(
                            theme: theme,
                            image: Icons.stacked_bar_chart,
                            symbol: "user 2",
                            totalQuantity: 8,
                            equityValue: 300.0,
                            pricePerShare: 600.0),
                        PortfolioPosition(
                            theme: theme,
                            image: Icons.stacked_bar_chart,
                            symbol: "user 3",
                            totalQuantity: 7,
                            equityValue: 450.0,
                            pricePerShare: 150.0),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Portfolio Value - It is the cumulative value of all the investments
                              /// or stocks held by an individual or company at a specific period.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                                child: Text('Loan Value',
                                    style: TextStyle(
                                      color: Constants.bgColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 6,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        colorCard("Value", 10000.00, 1, context,
                            Constants.balanceCard),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            BottomNavBar(theme: theme, index: 0)
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';

final formatCurrency = new NumberFormat.currency(locale: "en_US", symbol: "");

class PortfolioPosition extends StatelessWidget {
  const PortfolioPosition({
    Key key,
    @required this.theme,
    @required this.image,
    @required this.symbol,
    @required this.totalQuantity,
    @required this.equityValue,
    @required this.pricePerShare,
  }) : super(key: key);

  final ThemeUtils theme;
  final IconData image;
  final String symbol;
  final double totalQuantity;
  final double equityValue;
  final double pricePerShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: Card(
        elevation: 8.0,
        child: Row(children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xfff1f1f1)),
              child: Icon(image, size: 30, color: Color(0xff1f3c88))),
          SizedBox(width: 10),
          Expanded(
              flex: 2,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(symbol,
                              style: TextStyle(
                                  color: Constants.bgColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                                ' ${formatCurrency.format(equityValue)}',
                                style: TextStyle(
                                    color: Constants.bgColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(

                                  ' ${formatCurrency.format(pricePerShare)}',
                                  style: TextStyle(
                                      color: Constants.bgColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(totalQuantity.toString(),
                                style: TextStyle(
                                    color: Constants.bgColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ])
                  ]))
        ]),
      ),
    );
  }
}

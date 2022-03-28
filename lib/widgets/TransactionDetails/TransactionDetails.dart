import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';

final formatCurrency = new NumberFormat.currency(locale: "en_US", symbol: "");

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key key,
    @required this.theme,
    @required this.image,
    @required this.name,
    @required this.expenseDetail,
    @required this.date,
    @required this.amount,
    @required this.transferBy,
    @required this.isLoan,
  }) : super(key: key);

  final ThemeUtils theme;
  final IconData image;
  final String name;
  final String expenseDetail;
  final double amount;
  final String date;
  final String transferBy;
  final bool isLoan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        Text(name,
                            style: TextStyle(
                                color: Color(0xff070d59),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        Text(
                            (isLoan ? '\$' : '\$') +
                                formatCurrency.format(amount),
                            style: TextStyle(
                                color: isLoan
                                    ? Color(0xff070d59)
                                    : Colors.greenAccent[700],
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(expenseDetail,
                                style: TextStyle(
                                    color: Color(0x99070d59),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                            if (transferBy != null)
                              Text(' ' + transferBy,
                                  style: TextStyle(
                                      color: Color(0x99070d59),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))
                          ],
                        ),
                        Text(date,
                            style: TextStyle(
                                color: Color(0x99070d59),
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      ])
                ]))
      ]),
    );
  }
}

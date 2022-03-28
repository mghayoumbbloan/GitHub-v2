import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';
import 'package:trove_challenge/widgets/BottomNavBar/BottomNavBar.dart';
import 'package:trove_challenge/widgets/TransactionDetails/TransactionDetails.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  ThemeUtils theme = new ThemeUtils();

  dynamic expenseData = [
    {
      'today': [
        {
          'name': 'John loan',
          'image': Icons.payment,
          'amount': 50.00,
          'isLoan': true,
          'date': '30/05/2021',
          'expenseDetail': 'Ref: 1245676'
        },
        {
          'name': 'my first loan',
          'image': Icons.payments,
          'amount': 105.23,
          'isLoan': true,
          'date': '30/05/2021',
          'expenseDetail': 'Ref: 1345776'
        }
      ]
    },


    {
      'May 15': [
        {
          'name': 'My second loan',
          'image': Icons.payments,
          'amount': 15.23,
          'isLoan': true,
          'date': '15/05/2021',
          'expenseDetail': 'Ref: 7453593'
        }
      ]
    }
  ];

  String selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.4, 0.0),
                colors: [Color(0xff070d59), Color(0xff1f3c88)],
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        // color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Color(0xfff1f1f1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 32, right: 32, top: 25, bottom: 65),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Payment History',
                                            style: TextStyle(
                                                color: Color(0xff070d59),
                                                fontSize: 24)),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: expenseData.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Column(children: [
                                            SizedBox(height: 10),
                                            Row(children: [
                                              Text(
                                                  expenseData[index]
                                                      .keys
                                                      .toList()[0]
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[200],
                                                      fontSize: 16)),
                                            ]),
                                            SizedBox(height: 10),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white),
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          Divider(
                                                              height: 0,
                                                              color: Color(
                                                                  0xfff1f1f1)),
                                                  itemCount: expenseData[index][
                                                          expenseData[index]
                                                              .keys
                                                              .toList()[0]]
                                                      .length,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, itemIndex) {
                                                    return selectedFilter ==
                                                                null ||
                                                            selectedFilter != null &&
                                                                selectedFilter ==
                                                                    'income' &&
                                                                !expenseData[index][
                                                                        expenseData[index]
                                                                            .keys
                                                                            .toList()[0]][itemIndex]
                                                                    [
                                                                    'isLoan'] ||
                                                            selectedFilter !=
                                                                    null &&
                                                                selectedFilter ==
                                                                    'expense' &&
                                                                expenseData[index]
                                                                        [
                                                                        expenseData[index]
                                                                            .keys
                                                                            .toList()[0]]
                                                                    [itemIndex]['isLoan']
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        16),
                                                            child: TransactionDetails(
                                                                theme: theme,
                                                                name: expenseData[index][expenseData[index].keys.toList()[0]]
                                                                        [itemIndex]
                                                                    ['name'],
                                                                image: expenseData[index]
                                                                        [expenseData[index].keys.toList()[0]][itemIndex]
                                                                    ['image'],
                                                                amount: expenseData[index]
                                                                        [expenseData[index].keys.toList()[0]][itemIndex]
                                                                    ['amount'],
                                                                isLoan: expenseData[index]
                                                                        [expenseData[index].keys.toList()[0]][itemIndex]
                                                                    ['isLoan'],
                                                                date: expenseData[index]
                                                                        [expenseData[index].keys.toList()[0]][itemIndex]
                                                                    ['date'],
                                                                transferBy: expenseData[index]
                                                                            [expenseData[index].keys.toList()[0]]
                                                                        [itemIndex]
                                                                    ['transferBy'],
                                                                expenseDetail: expenseData[index][expenseData[index].keys.toList()[0]][itemIndex]['expenseDetail']),
                                                          )
                                                        : Container();
                                                  }),
                                            ),
                                          ]);
                                        }),
                                    SizedBox(height: 20)
                                  ])),
                        ))),
                BottomNavBar(theme: theme, index: 1)
              ]),
            )),
      ),
    );
  }
}

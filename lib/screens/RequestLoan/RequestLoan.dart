import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/utils/FormValidator.dart';
import 'package:trove_challenge/utils/SizeConfig.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';
import 'package:trove_challenge/widgets/BottomNavBar/BottomNavBar.dart';
import 'package:trove_challenge/widgets/Loaders/Loaders.dart';

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValue = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payback Period',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NumberPicker(
            axis: Axis.horizontal,
            value: _currentValue,
            minValue: 6,
            maxValue: 12,
            onChanged: (value) => setState(() => _currentValue = value),
          ),
        ),
        // Text('Selected Month: $_currentValue'),
      ],
    );
  }
}

class RequestLoan extends StatefulWidget {
  const RequestLoan({Key key}) : super(key: key);

  @override
  _RequestLoanState createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  ThemeUtils theme = new ThemeUtils();
  final _formKey = GlobalKey<FormState>();
  bool btnLoading = false;
  bool submmitedForm = false; // false

  void initState() {
    super.initState();
  }

  Widget _entryField(
    String title, {
    bool multiline = false,
    bool loanAmount = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: FormValidate.validateText,
            keyboardType: multiline
                ? TextInputType.multiline
                : ((loanAmount)
                    ? (TextInputType.numberWithOptions(decimal: true))
                    : (null)),
            inputFormatters: loanAmount
                ? [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ]
                : null,
            maxLines: multiline ? 5 : null,
            decoration: InputDecoration(
              hintText: title,
            ),
          ),
        ],
      ),
    );
  }

  Widget _applyButton() {
    return GestureDetector(
      onTap: () {
        final form = _formKey.currentState;
        if (form.validate()) {
          form.save();
          setState(() {
            btnLoading = true;
          });
          Future.delayed(Duration(milliseconds: 3000), () {
            setState(() {
              btnLoading = false;
              submmitedForm = true;
            });
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Constants.bgColorGradient1,
                  Constants.bgColorGradient2
                ])),
        child: btnLoading
            ? Loaders.Loader()
            : Text(
                'Submit',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.1,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _submittedDetails() {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage('assets/check.png'),
            ),
          ),
        ),
      ),
      Text(
        'Request has been submitted successfully.',
        style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 3.4,
          fontWeight: FontWeight.w600,
        ),
      )
    ]);
  }

  Widget _inputFields() {
    return Column(
      children: <Widget>[
        _entryField("Loan Title"),
        _entryField("Loan Amount"),
        _entryField("Description", multiline: true),
        // payback period
        _IntegerExample(),
        // submit button
        _applyButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 90,
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
                                    Text('Request Loan',
                                        style: TextStyle(
                                          color: Color(0xff070d59),
                                          fontSize: 24,
                                        )),
                                    Form(
                                      key: _formKey,
                                      child: submmitedForm
                                          ? _submittedDetails()
                                          : _inputFields(),
                                    ),
                                  ])),
                        ))),
                BottomNavBar(theme: theme, index: 2)
              ]),
            )),
      ),
    );
  }
}

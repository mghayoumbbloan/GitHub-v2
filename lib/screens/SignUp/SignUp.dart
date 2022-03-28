import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/utils/FormValidator.dart';
import 'package:trove_challenge/utils/SizeConfig.dart';
import 'package:trove_challenge/utils/bezierContainer.dart';
import 'package:trove_challenge/widgets/Common/Common.dart';
import 'package:trove_challenge/widgets/Loaders/Loaders.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final _globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool btnLoading = false;

  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Widget _entryField(String title,
      {bool isPassword = false, bool isPhoneNumber = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 3.85,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (isPassword)
                ? (FormValidate.validatePassword)
                : ((isPhoneNumber)
                    ? (FormValidate.validatePhoneNumber)
                    : (FormValidate.validateEmail)),
            obscureText: isPassword ? !_passwordVisible : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3fff4),
              filled: true,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Constants.bgColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        final form = _formKey.currentState;
        if (form.validate()) {
          form.save();
          setState(() {
            btnLoading = true;
          });

          /// Simulate http requests
          Future.delayed(Duration(milliseconds: 3000), () {
            Navigator.of(context).pushNamed('/home');
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
            : Text('Register',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.2,
                  color: Colors.white,
                )),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/signin');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Already have an account ?',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3.45,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              width: 10,
            ),
            Text('Login',
                style: TextStyle(
                    color: Constants.balanceCard,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.45,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email Address"),
        _entryField("Phone Number", isPhoneNumber: true),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      Common.title(context),
                      SizedBox(
                        height: 50,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: Common.backButton(context)),
          ],
        ),
      ),
    );
  }
}

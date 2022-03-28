import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/provider/User.dart';
import 'package:trove_challenge/utils/SizeConfig.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';
import 'package:trove_challenge/widgets/BottomNavBar/BottomNavBar.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  ThemeUtils theme = new ThemeUtils();
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  UserProvider _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.4, 0.0),
                colors: [
                  Constants.bgColorGradient1,
                  Constants.bgColorGradient2
                ],
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
                              left: 15, right: 15, top: 20, bottom: 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              width: 140.0,
                                              height: 140.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    _user.getUser.image,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 90.0, right: 100.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundColor: Colors.red,
                                                radius: 25.0,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Constants.white,
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 35.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Personal Information',
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                        6,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              _status
                                                  ? _getEditIcon()
                                                  : Container(),
                                            ],
                                          )
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: TextFormField(
                                              initialValue:
                                                  _user.getUser.fullName,
                                              //
                                              decoration: const InputDecoration(
                                                hintText: "Full Name",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: TextFormField(
                                              initialValue:
                                                  _user.getUser.emailAddress,
                                              decoration: const InputDecoration(
                                                  hintText: "Email Address"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: TextFormField(
                                              initialValue:
                                                  _user.getUser.phoneNumber,
                                              decoration: const InputDecoration(
                                                  hintText: "Phone Number"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: "Password"),
                                                enabled: !_status,
                                                obscureText: true,
                                              ),
                                            ),
                                            flex: 2,
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                  hintText: "Confirm Password"),
                                              enabled: !_status,
                                              obscureText: true,
                                            ),
                                            flex: 2,
                                          ),
                                        ],
                                      )),
                                  !_status ? _getActionButtons() : Container(),
                                ],
                              ),
                            ],
                          ),
                        )))),
                BottomNavBar(theme: theme, index: 3)
              ]),
            )),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Constants.white,
                color: Constants.bgColorGradient1,
                onPressed: () {
                  print('SAVE WAS CLICKED!!');
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Constants.white,
                color: Colors.red,
                onPressed: () {
                  print('CANCEL WAS CLICKED!!');
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Constants.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

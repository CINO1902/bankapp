import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bankapp/linkfile/Models/new.dart';
import 'package:bankapp/linkfile/dialogerror.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:bankapp/Screens/login.dart';
import 'package:bankapp/Screens/register.dart';
import 'package:bankapp/linkfile/Models/registerModel.dart';
import 'package:bankapp/linkfile/customSnackbar.dart';
import 'package:bankapp/linkfile/loading_widget%202.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bankapp/linkfile/networkhandler.dart';
import 'package:http/http.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final storage = new FlutterSecureStorage();
  bool value = false;
  bool _visible = true;
  String email = '';
  bool _visibleC = true;
  String password = '';
  String _cpassword = '';
  late String msg1;
  late String ID;
  late String PIN;
  String success = '';
  late String token;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  Future<void> _signUp() async {
    try {
      setState(() {
        Loadingwidget2.show(context);
      });

      registerModel RegisterModel = registerModel(
        ID: ID,
        PIN: PIN,
      );
      var response = await networkHandler.client.post(
          networkHandler.builderUrl(
            '/register',
          ),
          body: registerModelToJson(RegisterModel),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });

      var data = jsonDecode(response.body);
      msg1 = data['msg'];
      success = data['success'];
    } catch (e) {
      if (e.toString() == 'Operation timed out') {
        print(e.toString());
        await showDialog(
          context: context,
          builder: (context) {
            return Dialogue();
          },
        );
      } else if (e.toString() == 'Connection failed') {
        print(e.toString());
        await showDialog(
          context: context,
          builder: (context) {
            return Dialogueanomaly();
          },
        );
      } else {
        print(e.toString());
        await showDialog(
          context: context,
          builder: (context) {
            return Dialogueanomaly();
          },
        );
      }
    } finally {
      setState(() {
        Loadingwidget2.hide(context);
      });
    }
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: Stack(children: [
          Stack(
            children: [
              Container(
                  //   color: Colors.red,
                  // constraints: BoxConstraints(maxHeight: 210, maxWidth: 210, minHeight: 100, minWidth: 100),

                  child: Container(
                //color: Colors.red,
                clipBehavior: Clip.none,
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.4,
                  MediaQuery.of(context).size.height * 0.001,
                  MediaQuery.of(context).size.width * 0.0,
                  MediaQuery.of(context).size.height * 0.7,
                ),
                child: SvgPicture.asset("images/hexagon.svg",
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.08)),
              )),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            // color: Colors.red,
                            width: double.infinity,
                            //constraints: BoxConstraints(maxHeight: 80, maxWidth: 80, minHeight: 80, minWidth: 80),
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.13,
                            ),
                            child: SvgPicture.asset(
                              "images/hexagon.svg",
                              color: Theme.of(context).primaryColor,
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Create An Acount,",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(250),
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        // top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Sign up to continue,",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 17,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        // top:  MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Form(
                        key: _key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(children: [
                          TextFormField(
                            validator: _validateName,
                            onSaved: (value) => setState(() {
                              ID = value!;
                            }),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      width: 1.7),
                                ),

                                // hintText: 'Enter Your Email Here',
                                labelText: 'ID'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: _validateEmail,
                            onSaved: (value) => setState(() {
                              PIN = value!;
                            }),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.fingerprint_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      width: 1.7),
                                ),

                                // hintText: 'Enter Your Email Here',
                                labelText: 'PIN'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.05,
                        MediaQuery.of(context).size.height * 0.0,
                        MediaQuery.of(context).size.width * 0.0,
                        MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        child: CupertinoButton(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                          onPressed: () {
                            _sendToServer();
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(child: Text("Don't have an account?")),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.05,
                        MediaQuery.of(context).size.height * 0.0,
                        MediaQuery.of(context).size.width * 0.0,
                        MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        child: CupertinoButton(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => login()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(child: Text("Terms and Conditions")),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  String? _validateName(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Please Input Your ID";
    } else if (!regExp.hasMatch(value)) {
      return "ID must contain only numbers";
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    RegExp regex = new RegExp('[0-9]');
    if (value!.length == 0) {
      return "Please Enter Your PIN";
    } else if (!regex.hasMatch(value)) {
      return "PIN must contain Only Numver";
    } else if (value.length == 6) {
      return "PIN must be a 6 digit number";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.length == 0) {
      return "Please Input a Password";
    } else if (value.length < 8) {
      return "Password Must be more that 7 Characters";
    } else {
      return null;
    }
  }

  String? _validateCPassword(String? value) {
    if (value!.length == 0) {
      return "Please Input a Password";
    } else if (_pass.text != _confirmPass.text) {
      return "Password Does not match";
    } else {
      return null;
    }
  }

  _sendToServer() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();

      await _signUp();

      if (success == 'true') {
        // Navigator.of(context).push(MaterialPageRoute(builder:
        //     (context) => home()
        //     ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomeSnackbar(
            topic: 'Great!',
            msg: msg1,
            color1: Color.fromARGB(255, 25, 107, 52),
            color2: Color.fromARGB(255, 19, 95, 40),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));
      }
      if (success == 'false') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomeSnackbar(
              topic: 'Oh Snap!',
              msg: msg1,
              color1: Color.fromARGB(255, 171, 51, 42),
              color2: Color.fromARGB(255, 127, 39, 33),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomeSnackbar(
          topic: 'Oh Snap!',
          msg: 'Please Fill Out all fields',
          color1: Color.fromARGB(255, 171, 51, 42),
          color2: Color.fromARGB(255, 127, 39, 33),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    }
  }

  void _show() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _showC() {
    setState(() {
      _visibleC = !_visibleC;
    });
  }
}

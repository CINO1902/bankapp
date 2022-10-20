import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bankapp/Screens/home.dart';
import 'package:bankapp/Screens/register.dart';
import 'package:bankapp/linkfile/Models/loginModel.dart';
import 'package:bankapp/linkfile/Models/new.dart';
import 'package:bankapp/linkfile/customSnackbar.dart';
import 'package:bankapp/linkfile/dialogerror.dart';
import 'package:bankapp/linkfile/loading_widget%202.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bankapp/linkfile/networkhandler.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool value = false;
  bool _visible = true;
  String email = '';
  String password = '';
  late String msg1;
  String? name;
  String success = '';
  late String token;
  late String ID;
  late String PIN;
  final GlobalKey<FormState> _key1 = GlobalKey<FormState>();

  Future<void> _login() async {
    try {
      setState(() {
        Loadingwidget2.show(context);
      });
      LoginModel loginmodel = LoginModel(ID: ID, PIN: PIN);

      var response = await networkHandler.client.post(
          networkHandler.builderUrl(
            '/login',
          ),
          body: LoginModelToJson(loginmodel),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });

      var data = jsonDecode(response.body);
      msg1 = data['msg'];
      success = data['success'];
      if (success == 'true') {
        token = data['token'];
      }

      print(data);
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

                  child: Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.4,
                  MediaQuery.of(context).size.height * 0.0,
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
                        "Welcome Back,",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(250),
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
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
                        "Sign in to continue,",
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
                        key: _key1,
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
                                      color: Color.fromARGB(255, 70, 70, 70),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 70, 70, 70),
                                      width: 1.7),
                                ),

                                // hintText: 'Enter Your Email Here',
                                labelText: 'ID'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: _validatePassword,
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
                                      color: Color.fromARGB(255, 70, 70, 70),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 70, 70, 70),
                                      width: 1.7),
                                ),

                                // hintText: 'Enter Your Email Here',
                                labelText: 'PIN'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      value: value,
                                      onChanged: (value) =>
                                          setState(() => this.value = value!)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 40,
                                child: Text(
                                  "Remember Me",
                                  maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 17),
                                ),
                              )
                            ],
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
                            'Sign In',
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
                                builder: (context) => register()));
                          },
                          child: Text(
                            'Sign Up',
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

  String? _validateEmail(String? value) {
    RegExp regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}.com');
    if (value!.length == 0) {
      return "Please Input a name";
    } else if (!regex.hasMatch(value)) {
      return "Must Be a valid email";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.length == 0) {
      return "Please Input a name";
    } else if (value.length < 8) {
      return "Password Must be more that 7 Characters";
    } else {
      return null;
    }
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

  _sendToServer() async {
    if (_key1.currentState!.validate()) {
      _key1.currentState!.save();

      await _login();
      print(success);
      if (success == 'true') {
        // await storage.write(key: 'token', value: token);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        Navigator.pushNamed(context, '/home');
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
}

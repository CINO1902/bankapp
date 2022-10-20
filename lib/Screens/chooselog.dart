import 'dart:async';

import 'package:bankapp/Screens/home.dart';
import 'package:bankapp/Screens/login.dart';
import 'package:bankapp/Screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chooselog extends StatefulWidget {
  const chooselog({Key? key}) : super(key: key);

  @override
  State<chooselog> createState() => _chooselogState();
}

class _chooselogState extends State<chooselog> {
  bool hasInternet = false;
  late StreamSubscription subscription;
  bool _isAlert = false;
  bool _shown = false;

  String? value;
  String? value1;
  @override
  initState() {
    checkState(); // this is called when the class is initialized or called for the first time
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
    getConnectivity();
  }

  getConnectivity() {
    subscription = InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() => this.hasInternet = hasInternet);
      if (!hasInternet && _isAlert == false) {
        showDialogBox();
        setState(() {
          _isAlert = true;

          showSimpleNotification(Text("No Internet Connection"),
              background: Colors.red);
        });
      }
    });
  }

  final prefs = SharedPreferences.getInstance();
  checkState() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = await prefs.getString('token');
    // print(value);
    setState(() {
      value1 = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return value1 != null
        ? home()
        : Scaffold(
            body: CupertinoPageScaffold(
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  //margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15,),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bank.png"),
                        fit: BoxFit.cover),
                  ),
                ),
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
                          color: Color.fromARGB(255, 242, 242, 242)),
                    )),
                    Column(
                      children: [
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 110,
                                maxWidth: 110,
                                minHeight: 100,
                                minWidth: 100),
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1,
                            ),
                            child: SvgPicture.asset(
                              "images/hexagon.svg",
                              color: Color.fromARGB(255, 101, 101, 101),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: MediaQuery.of(context).size.width * 0.09,
                          ),
                          child: Text(
                            "Work And Get Paid",
                            style: TextStyle(
                                color: Color.fromARGB(255, 101, 101, 101),
                                fontSize: 23,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  //color: Colors.red,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.65,
                  ),
                  child: Column(children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 2)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
            ),
          );
  }

  showDialogBox() => showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('No connection'),
          content: Text('Please check your Internet connection'),
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() {
                    _isAlert = false;
                  });
                  hasInternet = await InternetConnectionChecker().hasConnection;
                  if (!hasInternet && _isAlert == false) {
                    showDialogBox();
                    setState(() {
                      _isAlert = true;
                    });
                  } else {
                    showSimpleNotification(Text("Back online"),
                        background: Colors.green);
                  }
                },
                child: const Text('Ok'))
          ],
        ),
      );
}

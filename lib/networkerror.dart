import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:bankapp/Screens/invisible.dart';
import 'package:bankapp/main.dart';

class notNetwok extends StatefulWidget {
  const notNetwok({Key? key}) : super(key: key);

  @override
  State<notNetwok> createState() => _notNetwokState();
}

class _notNetwokState extends State<notNetwok> {
  bool hasInternet = false;

  late StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() => this.hasInternet = hasInternet);
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 215, 215),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'images/raining-svgrepo-com.svg',
                    color: Color.fromARGB(255, 191, 191, 191),
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  SvgPicture.asset(
                    'images/cloudy-cloud-svgrepo-com.svg',
                    color: Color.fromARGB(255, 191, 191, 191),
                    height: MediaQuery.of(context).size.height * 0.30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'images/water-svgrepo-com.svg',
                        color: Color.fromARGB(255, 191, 191, 191),
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SvgPicture.asset(
                        'images/water-svgrepo-com.svg',
                        color: Color.fromARGB(255, 191, 191, 191),
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SvgPicture.asset(
                        'images/water-svgrepo-com.svg',
                        color: Color.fromARGB(255, 191, 191, 191),
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'images/tree-svgrepo-com.svg',
                    color: Color.fromARGB(255, 191, 191, 191),
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const FittedBox(
                      child: Text(
                    'No Internet',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const FittedBox(
                      child: Text(
                    'Connection',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 70, 70, 70)),
                  )),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  child: const Text(
                    'Please check your internet connection and try again',
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2,
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 65, 65, 65)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      print(hasInternet);

                      if (hasInternet == true) {
                        Navigator.pushNamed(context, '/invisible');
                      }
                    },
                    child: Text('Try Again'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

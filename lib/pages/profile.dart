import 'package:bankapp/linkfile/providerlink/theme_provider.dart';
import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final getdetail = Provider.of<getdetails>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: CupertinoPageScaffold(
            child: SingleChildScrollView(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.height *
                                      0.032,
                                  backgroundImage:
                                      AssetImage('images/caleb.png'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                        // horizontal: MediaQuery.of(context).size.height * 0.01,
                                        top: MediaQuery.of(context).size.width *
                                            0.03,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.029,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: FittedBox(
                                          child: Text(
                                        'Caleb Oruta',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Text(
                                        'Account 1',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(.5)),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                // horizontal: MediaQuery.of(context).size.height * 0.01,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: FittedBox(
                                  child: Text(
                                '${getdetail.balance}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ))),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/myaccount');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    child: Icon(
                                  CupertinoIcons.person,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    'My Account',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                child: Icon(
                              CupertinoIcons.forward,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    child: Icon(
                                  CupertinoIcons.bell,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    'Notifications',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                child: Icon(
                              CupertinoIcons.forward,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/theme');

                    // context
                    //     .read<Themeprovider>()
                    //     .checktheme(Theme.of(context).scaffoldBackgroundColor);

                    //context.read<Themeprovider>().checktogg();
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    child: Icon(
                                  CupertinoIcons.settings,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    'Theme',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                child: Icon(
                              CupertinoIcons.forward,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  child: Icon(
                                CupertinoIcons.question_circle,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Text(
                                  'Help Center',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              child: Icon(
                            CupertinoIcons.forward,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          )),
                        ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove('token');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  child: Transform.rotate(
                                      angle: 100 * math.pi / 100,
                                      child: SvgPicture.asset(
                                        'images/svg/log-out.svg',
                                        color: Colors.red,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                child: Icon(
                              CupertinoIcons.forward,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )),
                          ]),
                    ),
                  ),
                )
              ])),
        )));
  }
}

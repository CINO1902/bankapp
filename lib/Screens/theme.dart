import 'package:bankapp/linkfile/providerlink/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class themepage extends StatefulWidget {
  const themepage({super.key});

  @override
  State<themepage> createState() => _themepageState();
}

class _themepageState extends State<themepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CupertinoPageScaffold(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Appearance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "images/hexagon.svg",
                              color: Colors.black,
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                            )
                          ],
                        ),
                      ),
                    ),
                    Radio(
                      value: 1,
                      groupValue: context.watch<Themeprovider>().group,
                      onChanged: (int? value) {
                        context.read<Themeprovider>().changetheme(value);
                      },
                    ),
                    Text('Light'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "images/hexagon.svg",
                              color: Colors.white,
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                            )
                          ],
                        ),
                      ),
                    ),
                    Radio(
                      value: 2,
                      groupValue: context.watch<Themeprovider>().group,
                      onChanged: (int? value) {
                        context.read<Themeprovider>().changetheme(value);
                      },
                    ),
                    Text('Dark')
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use Device Settings',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "Match appearance to your device's Display & Brightness settings",
                        softWrap: true,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                buildSwitch(),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget buildSwitch() => Switch.adaptive(
      value: context.watch<Themeprovider>().togg,
      onChanged: (value) {
        context.read<Themeprovider>().changetogg(value);
      });
}

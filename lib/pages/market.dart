import 'package:bankapp/Screens/airtime.dart';
import 'package:bankapp/Screens/payment.dart';
import 'package:bankapp/linkfile/providerlink/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 21,
            // color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CupertinoPageScaffold(
          child: Column(children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/transfer');
            // Navigator.push(context, MaterialPageRoute(builder: ((context) {
            //   return ChangeNotifierProvider(
            //       create: (context) => showrecent(), child: airtime());
            // })));
          },
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).primaryColor),
                  top: BorderSide(color: Theme.of(context).primaryColor)),
            ),
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Make Transfer',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/airtime');
            // Navigator.push(context, MaterialPageRoute(builder: ((context) {
            //   return ChangeNotifierProvider(
            //       create: (context) => showrecent(), child: airtime());
            // })));
          },
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).primaryColor)),
            ),
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buy Airtime',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30,
                )
              ],
            ),
          ),
        )
      ])),
    );
  }
}

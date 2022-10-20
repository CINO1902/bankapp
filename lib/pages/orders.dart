import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
          child: Container(
              child: Column(children: [
            Container(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.03,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.4,
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '₦120,000.00',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Money In',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red.withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.055,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '₦1,000.00',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Money Out',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.height * 0.025,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                              ),
                              child: Icon(
                                Icons.balance_outlined,
                                size: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '₦10,000.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Balance',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/createbudget');
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).primaryColor)),
                          child: Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                                width:
                                    MediaQuery.of(context).size.height * 0.025,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                ),
                                child: Icon(
                                  Icons.history,
                                  size: 17,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: MediaQuery.of(context).size.width *
                                        0.055,
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'No Budget',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: MediaQuery.of(context).size.width *
                                        0.04,
                                    child: FittedBox(
                                      child: Text(
                                        'Create a Budget',
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.red,
              margin: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'images/svg/piechart.svg',
                    width: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: FittedBox(
                              child: Text(
                            'Create A Saving Plan',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.04,
                          // color: Colors.red,
                          child: Text(
                            'Stricty savings automatically. Daily, weekly or Monthly',
                            softWrap: true,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                'Savings History',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),
            ),
            Container(
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SvgPicture.asset(
                  'images/svg/folder-empty.svg',
                  width: MediaQuery.of(context).size.height * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.grey,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.15,
                  // color: Colors.red,
                  child: Text(
                    'No Savings Made Yet',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                )
              ]),
            )
          ])),
        ),
      ),
    );
  }

  Future openDialog() => showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text('Enter Savings Plan'),
            content: CupertinoTextField(
              autofocus: true,
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

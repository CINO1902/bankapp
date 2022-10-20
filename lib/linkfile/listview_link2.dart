import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget listview2(BuildContext context, index, transactio, anotherdate,
    finalmonth, finalday, credit) {
  bool direct;
  bool direct1;
  bool direct2;
  var last = anotherdate.length - 1;
  if (anotherdate.length == 1) {
    direct = true;
  } else {
    direct = false;
  }

  if (index == 0) {
    direct1 = true;
  } else {
    direct1 = false;
  }

  if (last == index) {
    direct2 = false;
  } else {
    direct2 = true;
  }
  final finaltime = transactio.createdAt.toString().split(' ')[1];
  final timesplit = finaltime.split(':')[1];
  final hoursplit = finaltime.split(':')[0];
  return Column(
    children: [
      InkWell(
        onTap: () async {
          _modalpopup(context, index, transactio, anotherdate, finalmonth,
              finalday, credit, hoursplit, timesplit);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: .7),
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: direct
                ? BorderRadius.circular(15)
                : direct1
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))
                    : direct2
                        ? BorderRadius.only()
                        : BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.height * 0.055,
                        child: FittedBox(
                            child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                  'images/bank-svgrepo-com-2.svg',
                                  color: Theme.of(context).primaryColor,
                                )))),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            '${transactio.detail}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            '${transactio.description}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      credit
                          ? '${transactio.amount}'
                          : '- ₦${transactio.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: credit
                            ? CupertinoColors.systemGreen
                            : Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${hoursplit}:${timesplit}',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onTertiary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

void _modalpopup(context, index, transactio, anotherdate, finalmonth, finalday,
    credit, hoursplit, timesplit) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 5, left: 20, right: 10),
                  width: double.infinity,
                  height: 40,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: -0.4,
                          fontWeight: FontWeight.bold,
                          color:
                              Color.fromARGB(255, 39, 39, 39).withOpacity(0.6),
                        ),
                      ),
                      Text(
                        'Transaction',
                        style: TextStyle(
                          fontSize: 23,
                          letterSpacing: -0.4,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Share',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: -0.4,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3,
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.1,
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                width:
                                    MediaQuery.of(context).size.height * 0.055,
                                child: FittedBox(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SvgPicture.asset(
                                          'images/bank-svgrepo-com-2.svg',
                                          color: Theme.of(context).primaryColor,
                                        )))),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: FittedBox(
                                child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${transactio.detail}',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -1.2),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'On ${finalmonth} ${finalday} at ${hoursplit}:${timesplit}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  '${transactio.amount}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                // color: Colors.red,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.92,
                                child: Text(
                                  '${transactio.detail} (${transactio.description})',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                                child: Text(
                                  credit ? 'From' : 'To',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  '${transactio.to}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  'Description',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  '${transactio.letter}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              left: 10,
                              right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Text(
                                      'Transaction Type',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Text(
                                      credit ? 'Credit' : 'Debit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Text(
                                      'Fees',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Text(
                                      '₦0.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

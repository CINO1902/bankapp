import 'package:bankapp/linkfile/Models/new.dart';
import 'package:bankapp/linkfile/Models/trasaction_model.dart';

import 'package:bankapp/linkfile/listview_link2.dart';

import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'package:provider/provider.dart';

class allTransaction extends StatefulWidget {
  const allTransaction({Key? key}) : super(key: key);

  @override
  State<allTransaction> createState() => _allTransactionState();
}

class _allTransactionState extends State<allTransaction>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  bool _value = false;

  var transaction;
  var description;
  var amount;
  var date;
  var transactionlenght;
  var twenty;
  var twentyto;
  var time;
  List<Detail> transactions = [];

  List<String> possitive = [];
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<String> dateget = [];
  List<String> dateget1 = [];
  List<String> dateget2 = [];
  late final TabController controller = TabController(length: 3, vsync: this)
    ..addListener(() {
      setState(() {});
    });

  @override
  void initState() {
    super.initState();
    context.read<Services>().getTransaction.catchError((e) {
     // print(e.toString());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'All Transactions',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CupertinoPageScaffold(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            child: Row(
              children: [
                ActionChip(
                  backgroundColor: controller.index == 0
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(.4),
                  shape: StadiumBorder(),
                  onPressed: () {
                    controller.animateTo(0);
                  },
                  label: Text(
                    "  All  ",
                    style: controller.index == 0
                        ? TextStyle(
                            color: Theme.of(context).colorScheme.onSurface)
                        : TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(.4)),
                  ),
                ),
                SizedBox(width: 15),
                ActionChip(
                  backgroundColor: controller.index == 1
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(.4),
                  shape: StadiumBorder(),
                  onPressed: () {
                    controller.animateTo(1);
                  },
                  label: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Transform.rotate(
                          angle: 180 * math.pi / 100,
                          child: Icon(
                            Icons.arrow_circle_right,
                            size: 16,
                            color: controller.index == 1
                                ? CupertinoColors.systemGreen
                                : CupertinoColors.systemGreen.withOpacity(.4),
                          ),
                        ),
                      ),
                      Text(
                        "Income   ",
                        style: controller.index == 1
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.onSurface)
                            : TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(.4)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ActionChip(
                    backgroundColor: controller.index == 2
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(.4),
                    shape: StadiumBorder(),
                    onPressed: () {
                      controller.animateTo(2);
                    },
                    label: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Transform.rotate(
                            angle: 180 * math.pi / 270,
                            child: Icon(
                              Icons.arrow_circle_right,
                              size: 16,
                              color: controller.index == 2
                                  ? CupertinoColors.systemRed
                                  : CupertinoColors.systemRed.withOpacity(.4),
                            ),
                          ),
                        ),
                        Text(
                          "Expenses  ",
                          style: controller.index == 2
                              ? TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)
                              : TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(.4)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: controller,
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      context.read<Services>().getTransaction.catchError((e) {
                        print(e.toString());
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06,
                        right: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child:
                          Consumer<Services>(builder: (context, value, child) {
                        if (value.data == false) {
                          return Center(child: Loadingwidget2());
                        } else if (value.error) {
                          return Text(
                              'Opps Somethings is wrong ${value.errormessage}');
                        } else if (value.data == true) {
                          if (value.map.isEmpty) {
                            return Text(
                                "Opps!! You haven't made any transaction Yet");
                          }
                          transactions = value.map;
                          for (int i = 0; i < transactions.length; i++) {
                            dateget.add(
                                "${transactions[i].createdAt!.day < 10 ? '0${transactions[i].createdAt!.day}' : transactions[i].createdAt!.day}/${transactions[i].createdAt!.month < 10 ? '0${transactions[i].createdAt!.month}' : transactions[i].createdAt!.month}/${transactions[i].createdAt!.year}");
                          }
                          final distinctList = dateget.toSet().toList();

                          Iterable inReverse = distinctList.reversed;
                          var ListInReverse = inReverse.toList();
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: inReverse.length,
                              itemBuilder: (BuildContext context, int index) {
                                var thisdate = ListInReverse[index];
                                var splithis = thisdate.split('/')[0];
                                var monthsplit = thisdate.split('/')[1];
                                var finalday = thisdate.split('/')[0];
                                var finalyear = thisdate.split('/')[2];
                                DateTime datetime = DateTime.now();
                                String dateStr = datetime.toString();
                                var finalmonth =
                                    months[int.parse(monthsplit) - 1];
                                twenty = dateStr.split(' ')[0];
                                twentyto = twenty.split('-')[2];
                                var timenow = int.parse(twentyto);
                                var gett = timenow - 1;

                                var timestring =
                                    gett.toString().padLeft(2, "0");

                                if (splithis == twentyto) {
                                  time = 'Today';
                                } else if (splithis == timestring) {
                                  time = 'Yesterday';
                                } else {
                                  time = '${finalmonth} '
                                      ' ${finalday} '
                                      ' ${finalyear}';
                                }
                                //print(splithis);
                                final anotherdate = transactions
                                    .where((element) =>
                                        "${element.createdAt!.day < 10 ? '0${element.createdAt!.day}' : element.createdAt!.day}/${element.createdAt!.month < 10 ? '0${element.createdAt!.month}' : element.createdAt!.month}/${element.createdAt!.year}" ==
                                        thisdate)
                                    .toList();
                                Iterable inReverse = anotherdate.reversed;
                                var TransactInReverse = inReverse.toList();
                                //  print('date${anotherdate}');
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 5, top: 7),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.6),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: anotherdate.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final transactio =
                                              TransactInReverse[index];
                                          bool credit =
                                              transactio.trasctionType;

                                          return Column(
                                            children: [
                                              listview2(
                                                context,
                                                index,
                                                transactio,
                                                anotherdate,
                                                finalmonth,
                                                finalday,
                                                credit,
                                              ),
                                            ],
                                          );
                                        }),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                );
                              });
                        } else {
                          return Center(
                            child: Loadingwidget2(),
                          );
                        }
                      }),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      context.read<Services>().getTransaction;
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06,
                        right: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child:
                          Consumer<Services>(builder: (context, value, child) {
                        if (value.data == false) {
                          return Center(child: Loadingwidget2());
                        } else if (value.error) {
                          return Text(
                              'Opps Somethings is wrong ${value.errormessage}');
                        } else if (value.data == true) {
                          if (value.map.isEmpty) {
                            return Text(
                                "Opps!! You haven't made any transaction Yet");
                          }
                          final distinctList1 = transactions
                              .where((element) => element.trasctionType == true)
                              .toList();

                          for (int i = 0; i < distinctList1.length; i++) {
                            dateget1.add(
                                "${distinctList1[i].createdAt!.day < 10 ? '0${distinctList1[i].createdAt!.day}' : distinctList1[i].createdAt!.day}/${distinctList1[i].createdAt!.month < 10 ? '0${distinctList1[i].createdAt!.month}' : distinctList1[i].createdAt!.month}/${distinctList1[i].createdAt!.year}");
                          }
                          final distinctList = dateget1.toSet().toList();

                          Iterable inReverse = distinctList.reversed;
                          var ListInReverse = inReverse.toList();

                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: inReverse.length,
                              itemBuilder: (BuildContext context, int index) {
                                var thisdate = ListInReverse[index];
                                var splithis = thisdate.split('/')[0];
                                var monthsplit = thisdate.split('/')[1];
                                var finalday = thisdate.split('/')[0];
                                var finalyear = thisdate.split('/')[2];
                                DateTime datetime = DateTime.now();
                                String dateStr = datetime.toString();
                                var finalmonth =
                                    months[int.parse(monthsplit) - 1];
                                twenty = dateStr.split(' ')[0];
                                twentyto = twenty.split('-')[2];
                                var timenow = int.parse(twentyto);
                                var gett = timenow - 1;
                                //print(thisdate.description);
                                var timestring =
                                    gett.toString().padLeft(2, "0");

                                if (splithis == twentyto) {
                                  time = 'Today';
                                } else if (splithis == timestring) {
                                  time = 'Yesterday';
                                } else {
                                  time = '${finalmonth} '
                                      ' ${finalday} '
                                      ' ${finalyear}';
                                }
                                //print(splithis);
                                final anotherdate = transactions
                                    .where((element) =>
                                        "${element.createdAt!.day < 10 ? '0${element.createdAt!.day}' : element.createdAt!.day}/${element.createdAt!.month < 10 ? '0${element.createdAt!.month}' : element.createdAt!.month}/${element.createdAt!.year}" ==
                                            thisdate &&
                                        element.trasctionType == true)
                                    .toList();
                                Iterable inReverse = anotherdate.reversed;
                                var TransactInReverse = inReverse.toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.6),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: TransactInReverse.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final transactio =
                                              TransactInReverse[index];

                                          bool credit =
                                              transactio.trasctionType;

                                          return Column(
                                            children: [
                                              listview2(
                                                context,
                                                index,
                                                transactio,
                                                anotherdate,
                                                finalmonth,
                                                finalday,
                                                credit,
                                              ),
                                            ],
                                          );
                                        }),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                );
                              });
                        } else {
                          return Center(
                            child: Loadingwidget2(),
                          );
                        }
                      }),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      context.read<Services>().getTransaction;
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06,
                        right: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child:
                          Consumer<Services>(builder: (context, value, child) {
                        if (value.data == false) {
                          return Center(child: Loadingwidget2());
                        } else if (value.error) {
                          return Text(
                              'Opps Somethings is wrong ${value.errormessage}');
                        } else if (value.data == true) {
                          if (value.map.isEmpty) {
                            return Text(
                                "Opps!! You haven't made any transaction Yet");
                          }
                          final distinctList1 = transactions
                              .where(
                                  (element) => element.trasctionType == false)
                              .toList();

                          for (int i = 0; i < distinctList1.length; i++) {
                            dateget2.add(
                                "${distinctList1[i].createdAt!.day < 10 ? '0${distinctList1[i].createdAt!.day}' : distinctList1[i].createdAt!.day}/${distinctList1[i].createdAt!.month < 10 ? '0${distinctList1[i].createdAt!.month}' : distinctList1[i].createdAt!.month}/${distinctList1[i].createdAt!.year}");
                          }
                          final distinctList = dateget2.toSet().toList();

                          Iterable inReverse = distinctList.reversed;
                          var ListInReverse = inReverse.toList();

                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: inReverse.length,
                              itemBuilder: (BuildContext context, int index) {
                                var thisdate = ListInReverse[index];
                                var splithis = thisdate.split('/')[0];
                                var monthsplit = thisdate.split('/')[1];
                                var finalday = thisdate.split('/')[0];
                                var finalyear = thisdate.split('/')[2];
                                DateTime datetime = DateTime.now();
                                String dateStr = datetime.toString();
                                var finalmonth =
                                    months[int.parse(monthsplit) - 1];
                                twenty = dateStr.split(' ')[0];
                                twentyto = twenty.split('-')[2];
                                var timenow = int.parse(twentyto);
                                var gett = timenow - 1;
                                //print(thisdate.description);
                                var timestring =
                                    gett.toString().padLeft(2, "0");

                                if (splithis == twentyto) {
                                  time = 'Today';
                                } else if (splithis == timestring) {
                                  time = 'Yesterday';
                                } else {
                                  time = '${finalmonth} '
                                      ' ${finalday} '
                                      ' ${finalyear}';
                                }
                                //print(splithis);
                                final anotherdate = transactions
                                    .where((element) =>
                                        "${element.createdAt!.day < 10 ? '0${element.createdAt!.day}' : element.createdAt!.day}/${element.createdAt!.month < 10 ? '0${element.createdAt!.month}' : element.createdAt!.month}/${element.createdAt!.year}" ==
                                            thisdate &&
                                        element.trasctionType == false)
                                    .toList();
                                Iterable inReverse = anotherdate.reversed;
                                var TransactInReverse = inReverse.toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.6),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: TransactInReverse.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final transactio =
                                              TransactInReverse[index];

                                          bool credit =
                                              transactio.trasctionType;

                                          return Column(
                                            children: [
                                              listview2(
                                                context,
                                                index,
                                                transactio,
                                                anotherdate,
                                                finalmonth,
                                                finalday,
                                                credit,
                                              ),
                                            ],
                                          );
                                        }),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                );
                              });
                        } else {
                          return Center(
                            child: Loadingwidget2(),
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

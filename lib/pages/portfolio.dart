import 'dart:async';

import 'package:bankapp/linkfile/Models/new.dart';
import 'package:bankapp/linkfile/dialogerror.dart';

import 'package:bankapp/linkfile/listview_link2.dart';
import 'package:bankapp/linkfile/providerlink/loader.dart';
import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

import 'package:bankapp/pages/editwatchlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../linkfile/Models/trasaction_model.dart';

class portfolio extends StatefulWidget {
  const portfolio({Key? key}) : super(key: key);

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio>
    with SingleTickerProviderStateMixin {
  String name = '';
  String email = '';
  String? name1;

  bool _isloading = false;
  var transaction;
  var description;
  var amount;
  var date;
  var transactionlenght;
  var twenty;
  var twentyto;
  var time;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  // Future<void> fetchData() async {
  //   try {
  //     setState(() {});
  //     var token = await networkHandler.getToken();
  //     var response = await networkHandler.get('/user_transactions', token);

  //     var data1 = jsonDecode(response);

  //     name = data1['name'];
  //     email = data1['email'];
  //     name1 = name.split(" ")[0];

  //     // print(name);
  //   } finally {
  //     setState(() {});
  //   }
  // }

  List<Detail> transactions = [];
  List<Detail> transactions2 = [];
  List<Detail> transactions3 = [];
  bool inVisible = true;
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
  bool balance1 = true;
  Future<void> fetchlist() async {}
  void checkstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = await prefs.getBool('balance');

    if (value == null) {
      balance1 = true;
    } else {
      balance1 = value;
    }
  }

  late final TabController controller = TabController(length: 3, vsync: this)
    ..addListener(() {
      setState(() {});
    });

  @override
  initState() {
    super.initState();
    context.read<getdetails>().getdetail.catchError((e) {
      //  print(e.toString());
    });
    context.read<Services>().getTransaction.catchError((e) {
      print(e.toString());
      if (e.toString() == 'Operation timed out') {
        print(e.toString());
        showDialog(
          context: context,
          builder: (context) {
            return Dialogue();
          },
        );
      } else if (e.toString() == 'Connection failed') {
        showDialog(
          context: context,
          builder: (context) {
            return Dialogueanomaly();
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return Dialogueanomaly();
          },
        );
      }
      // Navigator.popUntil(context, ModalRoute.withName('/loading'));
    });
  }

  @override
  Widget build(BuildContext context) {
    final toggleblind = Provider.of<hidebalance>(context, listen: true);
    final getdetail = Provider.of<getdetails>(context, listen: true);
    return Scaffold(
      body: CupertinoPageScaffold(
        child: Container(
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                      right: MediaQuery.of(context).size.width * 0.06,
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.020,

                                    //color: Colors.red,
                                    child: FittedBox(
                                        child: Text(
                                      'Hello, Caleb Oruta',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white.withOpacity(.5)),
                                    ))),
                                Row(
                                  children: [
                                    Row(children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        child: FittedBox(
                                            child: Text(
                                          '₦',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: FittedBox(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            toggleblind.balance
                                                ? '******'
                                                : '${getdetail.balance}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<hidebalance>()
                                            .togglebalance();
                                      },
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          //color: Colors.red,
                                          child: FittedBox(
                                              child: Icon(
                                            toggleblind.balance
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.white.withOpacity(.5),
                                          ))),
                                    ),
                                  ],
                                ),
                                Container(
                                    //color: Colors.red,
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    //color: Colors.red,
                                    child: FittedBox(
                                        child: Text(
                                      'Account Balance',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 200, 200, 200)),
                                    ))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.033,
                                    width: MediaQuery.of(context).size.height *
                                        0.033,
                                    child: FittedBox(
                                        child: Icon(
                                      Icons.edit_notifications,
                                      color: Color.fromARGB(255, 200, 200, 200),
                                    ))),
                                SizedBox(width: 20),
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.height *
                                      0.027,
                                  backgroundImage:
                                      AssetImage('images/caleb.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 240, 240, 240),
                                        width: 1,
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: FittedBox(
                                        child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.wallet_giftcard_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ))),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Request',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 200, 200, 200)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 240, 240, 240),
                                        width: 1,
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: FittedBox(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: SvgPicture.asset(
                                              'images/bank-svgrepo-com-2.svg',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )))),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Airtime',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 200, 200, 200)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 240, 240, 240),
                                        width: 1,
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: FittedBox(
                                        child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.money,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ))),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Loan',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 200, 200, 200)),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26,
                ),
                height: MediaQuery.of(context).size.height * 0.17,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              //color: Colors.red,
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.55,
                              //color: Colors.red,
                              child: FittedBox(
                                  child: Text(
                                'Recent Transactions',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                              ))),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, '/alltransactions');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((_) {
                                return ChangeNotifierProvider.value(
                                    value: context.read<Services>(),
                                    child: allTransaction());
                              })));
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: FittedBox(
                                    child: Text(
                                  'See all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ))),
                          ),
                        ],
                      )),
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
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )
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
                                        ? Colors.green
                                        : Colors.green.withOpacity(.4),
                                  ),
                                ),
                              ),
                              Text(
                                "Income   ",
                                style: controller.index == 1
                                    ? TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      )
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
                                          ? Colors.red
                                          : Colors.red.withOpacity(.4),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Expenses  ",
                                  style: controller.index == 2
                                      ? TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        )
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
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.39,
                ),
                child: TabBarView(
                  controller: controller,
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        context.read<getdetails>().getdetail.catchError((e) {
                          print(e.toString());
                        });
                        context.read<Services>().getTransaction.catchError((e) {
                          print(e.toString());
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          right: MediaQuery.of(context).size.width * 0.06,
                          top: 10,
                        ),
                        child: Consumer<Services>(
                            builder: (context, value, child) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 5,
                                        ),
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
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                            return Center(child: Loadingwidget2());
                          }
                        }),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () async {
                        context.read<getdetails>().getdetail.catchError((e) {
                          print(e.toString());
                        });
                        context.read<Services>().getTransaction.catchError((e) {
                          print(e.toString());
                        });
                      },
                      child: Container(
                        //color: Colors.black,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          right: MediaQuery.of(context).size.width * 0.06,
                          top: 10,
                        ),
                        child: Consumer<Services>(
                            builder: (context, value, child) {
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
                                    (element) => element.trasctionType == true)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: TransactInReverse.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final transactio =
                                                TransactInReverse[index];

                                            bool credit =
                                                transactio.trasctionType;

                                            //            final possitive1 = possitive
                                            // .where((element) =>
                                            //     "${element}" ==
                                            //    true )
                                            // .toList();
                                            //print(possitive);
                                            return Column(
                                              children: [
                                                //Text('${anotherdate.length}')
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
                        context.read<getdetails>().getdetail.catchError((e) {
                          print(e.toString());
                        });
                        context.read<Services>().getTransaction.catchError((e) {
                          print(e.toString());
                        });
                      },
                      child: Container(
                        //color: Colors.black,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          right: MediaQuery.of(context).size.width * 0.06,
                          top: 10,
                        ),
                        child: Consumer<Services>(
                            builder: (context, value, child) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: TransactInReverse.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                                                SizedBox(
                                                  height: 1,
                                                )
                                              ],
                                            );
                                          }),
                                      SizedBox(
                                        height: 15,
                                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Column index3(BuildContext context, index, transactio, anotherdate, finalmonth,
    finalday, credit) {
  final finaltime = transactio.createdAt.toString().split(' ')[1];
  final timesplit = finaltime.split(':')[1];
  final hoursplit = finaltime.split(':')[0];
  return Column(
    children: [
      Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
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
                              color: Color.fromARGB(255, 240, 240, 240),
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
                            Text(
                              '${transactio.detail}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${transactio.description}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.6),
                                  fontWeight: FontWeight.w500),
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
                                  ? Colors.green
                                  : Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${hoursplit}:${timesplit}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}

Column index2(BuildContext context, index, transactio, anotherdate, finalmonth,
    finalday, credit) {
  final finaltime = transactio.createdAt.toString().split(' ')[1];
  final timesplit = finaltime.split(':')[1];
  final hoursplit = finaltime.split(':')[0];

  return Column(
    children: [
      Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                              color: Color.fromARGB(255, 240, 240, 240),
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
                            Text(
                              '${transactio.detail}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${transactio.description}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.6),
                                  fontWeight: FontWeight.w500),
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
                                  ? Colors.green
                                  : Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${hoursplit}:${timesplit}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}

Column index1(BuildContext context, index, transactio, anotherdate, finalmonth,
    finalday, credit) {
  bool direct;
  var last = anotherdate.length - 1;

  if (last == index) {
    direct = true;
  } else {
    direct = false;
  }
  final finaltime = transactio.createdAt.toString().split(' ')[1];
  final timesplit = finaltime.split(':')[1];
  final hoursplit = finaltime.split(':')[0];
  return direct
      ? index2(
          context, index, transactio, anotherdate, finalday, finalmonth, credit)
      : Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
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
                                color: Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.circular(15)),
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
                            Text(
                              '${transactio.detail}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${transactio.description}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.6),
                                  fontWeight: FontWeight.w500),
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
                                  ? Colors.green
                                  : Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${hoursplit}:${timesplit}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
}

Widget listview(BuildContext context, index, transactio, anotherdate,
    finalmonth, finalday, credit) {
  bool direct;
  if (anotherdate.length == 1) {
    direct = false;
  } else {
    direct = true;
  }

  return direct
      ? index0(
          context, index, transactio, anotherdate, finalmonth, finalday, credit)
      : index3(context, index, transactio, anotherdate, finalmonth, finalday,
          credit);
}

Column index0(BuildContext context, index, transactio, anotherdate, finalmonth,
    finalday, credit) {
  bool direct;
  if (index == 0) {
    direct = false;
  } else {
    direct = true;
  }
  final finaltime = transactio.createdAt.toString().split(' ')[1];
  final timesplit = finaltime.split(':')[1];
  final hoursplit = finaltime.split(':')[0];
  return direct
      ? index1(
          context, index, transactio, anotherdate, finalmonth, finalday, credit)
      : Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
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
                              color: Color.fromARGB(255, 240, 240, 240),
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
                            Text(
                              '${transactio.detail}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${transactio.description}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.6),
                                  fontWeight: FontWeight.w500),
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
                                  ? Colors.green
                                  : Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${hoursplit}:${timesplit}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
}

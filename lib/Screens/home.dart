import 'package:bankapp/api/services.dart';
import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bankapp/pages/market.dart';
import 'package:bankapp/pages/orders.dart';
import 'package:bankapp/pages/portfolio.dart';
import 'package:bankapp/pages/profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadusers();
  }

  static const screens = [
    portfolio(),
    Market(),
    Order(),
    Profile(),
  ];
  _loadusers() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Services(),
          ),
         
        ],
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              iconSize: 20,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              currentIndex: currentIndex,
              onTap: (index) => setState(() {
                    currentIndex = index;
                  }),
              activeColor: Theme.of(context).colorScheme.onTertiary,
              inactiveColor:
                  Theme.of(context).colorScheme.onTertiary.withOpacity(0.7),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.transfer_within_a_station),
                  label: 'Payment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Budget',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profile',
                )
              ]),
          tabBuilder: (BuildContext context, int index) {
            return IndexedStack(
              index: currentIndex,
              children: screens,
            );
          },
        ),
      ),
    );
  }
}

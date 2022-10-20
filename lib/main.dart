import 'dart:io';

import 'package:bankapp/Screens/airtime.dart';
import 'package:bankapp/Screens/chooselog.dart';
import 'package:bankapp/Screens/createbudget.dart';
import 'package:bankapp/Screens/home.dart';
import 'package:bankapp/Screens/invisible.dart';
import 'package:bankapp/Screens/login.dart';
import 'package:bankapp/Screens/myaccount.dart';
import 'package:bankapp/Screens/notifications.dart';
import 'package:bankapp/Screens/payment.dart';
import 'package:bankapp/Screens/quicksave.dart';
import 'package:bankapp/Screens/register.dart';
import 'package:bankapp/Screens/theme.dart';
import 'package:bankapp/linkfile/Models/new.dart';

import 'package:bankapp/linkfile/providerlink/loader.dart';

import 'package:bankapp/linkfile/providerlink/theme_provider.dart';
import 'package:bankapp/linkfile/services.dart';
import 'package:provider/provider.dart';
import 'package:bankapp/networkerror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  bool hasInternet = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  void initialization() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    print(hasInternet);
    FlutterNativeSplash.remove();
    setState(() {});
  }

  @override
  void dispose() {
  
    super.dispose();
    // initialization();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => hidebalance(),
          ),
          ChangeNotifierProvider(
            create: (context) => getdetails(),
          ),
          ChangeNotifierProvider(
            create: (context) => showrecent(),
          ),
          ChangeNotifierProvider(
            create: (context) => savingprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => timepicker(),
          ),
          ChangeNotifierProvider(
            create: (context) => calculatesavings(),
          ),
          ChangeNotifierProvider(
              create: (context) => Themeprovider(),
              builder: (context, _) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  initialRoute: '/',
                  themeMode: context.watch<Themeprovider>().getTheme(),
                  theme: myTheme.lighttheme,
                  darkTheme: myTheme.darktheme,
                  routes: {
                    '/': (context) => hasInternet ? invisible() : notNetwok(),
                    'loading': (context) => Loadingwidget2(),
                    '/tansfer': (context) => transfer(),
                    '/invisible': (context) => invisible(),
                    '/chooselog': (context) => chooselog(),
                    '/login': (context) => login(),
                    '/register': (context) => register(),
                    '/home': (context) => home(),
                    //'/budget': (context) => _homeState.screens[2],
                    '/transfer': (context) => transfer(),
                    //'/alltransactions': (_) => ChangeNotifierProvider.value(value: services, child: allTransaction()),
                    '/airtime': (context) => airtime(),
                    '/createbudget': (context) => saveme(),
                    '/saveinstant': (context) => quicksave(),
                    '/myaccount': (context) => myaccount(),
                    '/notifications': (context) => notification(),
                    '/theme': (context) => themepage(),
                  },
                  // theme: ThemeData(
                  //   scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224),
                  //   primaryColor: Color.fromARGB(255, 42, 101, 135),
                  //   primarySwatch: Colors.blue,

                  // ),
                );
              }),
        ],
      ),
    );
  }
}

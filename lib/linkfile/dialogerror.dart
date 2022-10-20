import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dialogue extends StatelessWidget {
  const Dialogue({Key? key}) : super(key: key);

  static show(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Dialogue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        title: Text("Connection Timeout"),
        content: Text(
            "The Server has taken too long to respond, Check your Internet connection and try again"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      // show the dialog
    );
  }
}

class Dialogueanomaly extends StatelessWidget {
  const Dialogueanomaly({Key? key}) : super(key: key);

  static show(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Dialogue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        title: Text("NetWork Anomaly"),
        content: Text("Something Unexpected happend, Please try again later."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      // show the dialog
    );
  }
}

class Dialogue2 extends StatelessWidget {
  const Dialogue2({Key? key}) : super(key: key);

  static show(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Dialogue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        title: Text("Connection Timeout"),
        content: Text(
            "The Server has taken too long to respond, Check your Internet connection and try again"),
        actions: [
          TextButton(
            child: Text("Retry"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              Navigator.pop(context);
            },
          ),
        ],
      ),

      // show the dialog
    );
  }
}

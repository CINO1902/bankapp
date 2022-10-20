import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class hidebalance extends ChangeNotifier {
  bool _balance = false;

  bool get balance => _balance;

  hidebalance()  {
    _loadFromPrefs();
   
  }
  togglebalance() {
    _balance = !_balance;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    final _pref = await SharedPreferences.getInstance();

    _balance = _pref.getBool('balance') ?? false;
    
    notifyListeners();
  }

  void deletepref() async {
    final _pref = await SharedPreferences.getInstance();

    _pref.remove('balance');
    notifyListeners();
  }

  _saveToPrefs() async {
    final _pref = await SharedPreferences.getInstance();

    _pref.setBool('balance', _balance);
  }
}

class showrecent with ChangeNotifier {
  int index = 0;

  showindex(index1) {
    index = index1;

    notifyListeners();
  }
}

class savingprovider with ChangeNotifier {
  int index = 0;

  showindex(index1) {
    index = index1;

    notifyListeners();
  }
}

class timepicker with ChangeNotifier {
  String finalday = DateTime.now().day.toString().padLeft(2, '0');
  String finalmonth = DateTime.now().month.toString();
  String finalyear = DateTime.now().year.toString();
  DateTime getdate = DateTime.now();

  showindex(finalday1, finalmonth1, finalyear1, getdate1) {
    finalday = finalday1;
    finalmonth = finalmonth1;
    finalyear = finalyear1;
    getdate = getdate1;

    notifyListeners();
  }
}

class calculatesavings with ChangeNotifier {
  String _amount = '0';
  String _text = '';
  bool _status = true;
  DateTime getdate = DateTime.now();

  String finalmonth2 = DateTime.now().month.toString();

  DateTime currentDate = DateTime.now();

  DateTime getdate1 = DateTime.now();
  int _difference = 0;
  int _choosenday = 0;
  int getDaily1 = 0;
  bool _decide = true;
  bool _restrict = true;

  String get amount => _amount;
  String get getText => _text;
  bool get decide => _decide;
  bool get status => _status;
  bool get restrict => _restrict;
  int get difference => _difference;

  getDate(getdate1) {
    currentDate = getdate1;
    _difference = currentDate.difference(getdate).inDays;
    print(_difference);
    getEligibilty();
    notifyListeners();
  }

  getDaily(getDaily1) {
    _choosenday = getDaily1;
    print(_choosenday);
    getEligibilty();
    notifyListeners();
  }

  getEligibilty() {
    final items = ['Day', 'Week', 'Month'];
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    String result = _amount.replaceAllMapped(reg, mathFunc);
    final usedifference = _difference + 1;
    final differenceweek = (usedifference / 7).round();
    final differencemonth = (usedifference / 30).round();
    var amountget = int.parse(_amount) * usedifference;
    String amountget1 = amountget.toString().replaceAllMapped(reg, mathFunc);

    if (_choosenday == 0) {
      amountget = int.parse(_amount) * usedifference;
    } else if (_choosenday == 1) {
      amountget = int.parse(_amount) * differenceweek;
    } else if (_choosenday == 2) {
      amountget = int.parse(_amount) * differencemonth;
    }
    if (_difference == 0) {
      _text = "Sorry you can't have a savings less that a Day";
      _status = true;
      notifyListeners();
    } else if (_difference < 6 && _choosenday == 1) {
      _text =
          "Sorry you can't have a savings less than a Week for a Weekly Plan";
      _status = true;
      notifyListeners();
    } else if (_difference < 30 && _choosenday == 2) {
      _text =
          "Sorry you can't have a savings less than a month for a Monthly Plan";
      _status = true;
      notifyListeners();
    } else {
      _text =
          "If you save ₦${result} every ${items[_choosenday]} you would have ₦${amountget.toString().replaceAllMapped(reg, mathFunc)} on the ";
      _status = false;
      notifyListeners();
    }
  }

  getamount(amount1) {
    _amount = amount1;

    getempty();

    notifyListeners();
  }

  getempty() {
    if (_amount.length == 0) {
      _decide = true;
    } else if ((_amount.length != 0)) {
      _decide = false;
      getrestrict();
      getEligibilty();
    }
    notifyListeners();
  }

  getrestrict() {
    if (int.parse(_amount) < 200) {
      _restrict = true;
    } else {
      _restrict = false;
    }
    notifyListeners();
  }
}

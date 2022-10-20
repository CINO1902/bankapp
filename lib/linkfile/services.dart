import 'dart:async';

import 'dart:io';

import 'package:bankapp/linkfile/Models/balanceModel.dart';
import 'package:bankapp/linkfile/Models/loginModel.dart';
import 'package:bankapp/linkfile/Models/trasaction_model.dart';

import 'package:bankapp/linkfile/networkhandler.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services with ChangeNotifier {
  bool _error = false;
  bool _data = false;
  List<Detail> _map = [];
  String _errormessage = '';

  List<Detail> get map => _map;
  bool get error => _error;
  bool get data => _data;
  String get errormessage => _errormessage;

  Future<void> get getTransaction async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString("token");
    try {
      final response = await networkHandler.client
          .get(networkHandler.builderUrl('/getalert'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        //print(response);
        final decodedresponse = trasactionModelFromJson(response.body);
        _map = decodedresponse.detail ?? [];

        // _map = jsonDecode(response);
        _error = false;
        _data = true;
      } else {
        _error = true;
        _errormessage = 'There is something wrong with your network';
        _map = [];
      }
    } catch (e) {
      throw e;
    } finally {}

    notifyListeners();
    print(_map);
  }
}

class getdetails with ChangeNotifier {
  bool _data = false;
  String _balance = '0.00';

  String get balance => _balance;
  bool get data => _data;

  getdetails() {
    _loadfrompref();
  }
  _loadfrompref() async {
    final _pref = await SharedPreferences.getInstance();
    _balance = _pref.getString('bal') ?? '0.00';
  }

  _savetopref() async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setString('bal', _balance);
  }

  Future<void> get getdetail async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString("token");
    try {
      final response = await networkHandler.client
          .get(networkHandler.builderUrl('/getdetails'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        final decodedresponse = balanceModelFromJson(response.body);
        _balance = decodedresponse.balance!.balance ?? '';

        _data = true;
        _savetopref();
      } else {
        _data = false;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
    print(balance);
  }
}

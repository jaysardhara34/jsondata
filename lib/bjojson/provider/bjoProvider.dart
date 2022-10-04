import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsondata/bjojson/modal/bjoModal.dart';
import 'package:jsondata/userScreen/modal/homeModal.dart';
import 'package:http/http.dart' as bjuhttp;

class BjoProvider extends ChangeNotifier {
  List JsonList = [];

  Future<List> getUserData() async {
    var Jsonfile = await bjuhttp.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    JsonList = jsonDecode(Jsonfile.body);
  print(JsonList);
 return JsonList.map((e) => BjoModal().bjoFromJson(e)).toList();
  }
}

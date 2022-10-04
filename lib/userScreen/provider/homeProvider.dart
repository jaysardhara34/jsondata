import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsondata/userScreen/modal/homeModal.dart';

class HomeProvider extends ChangeNotifier {
  List JsonList = [];

  Future<List> getUserData() async {
    var jsonLink =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    JsonList = jsonDecode(jsonLink.body);
    return JsonList.map((e) => HomeModal().fromJson(e)).toList();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/TModelClass.dart';

List<String> myList = [];

class ApiProvider {
  fetch() async {
    var response =
        await http.get(Uri.parse('https://api.first.org/data/v1/countries'));
    return jsonDecode(response.body);
  }

  Future<List<ModelClass>> getAllEntries() async {
    var result = await fetch();
    List<ModelClass> list = [];
    Map<String, dynamic> map = result['data'];
    var a = map.keys.toList();
    myList.addAll(a);
    for (var i = 0; i < a.length; i++) {
      String name = a[i];
      Map<String, dynamic> b = result['data'][name];
      list.add(ModelClass.fromMap(b));
    }
    return list;
  }
}
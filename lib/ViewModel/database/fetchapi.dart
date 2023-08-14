import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnopus/model/apimodel.dart';

late Future<List<ModelClass>> result;
late List data;
String? country;

Future<List<ModelClass>> fetchApi(country) async {
  // var url = Uri.parse(
  //     'http://universities.hipolabs.com/search?country=United+States');
  var url =
      Uri.parse('http://universities.hipolabs.com/search?country=$country');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    data = jsonDecode(response.body);
    return data.map((e) => ModelClass.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnopus/model/rankingapi.dart';

late Future<List<Fields>> result;
Map<String, dynamic> value = {};
List<dynamic> data = [];
String? rankcountry;

Future<List<Fields>> fetchRankingApi(rankcountry) async {
  var url = Uri.parse(

    //'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=10&sort=university_name&refine.country=Australia&refine.national_rank=1-2',
    'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=1&sort=world_rank&facet=world_rank&facet=university_name&facet=national_rank&facet=year&facet=country&refine.country=$rankcountry',
    //'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&sort=world_rank&facet=world_rank&facet=university_name&facet=national_rank&facet=year&facet=country&refine.country=India',
    //'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&sort=world_rank&facet=world_rank&facet=university_name&facet=national_rank&facet=year&facet=country',
  );
  var response = await http.get(url);
  if (response.statusCode == 200) {
    value = jsonDecode(response.body);
    data = value['records'];
    List<Fields> fieldsList =
        data.map((record) => Fields.fromJson(record['fields'])).toList();
    return fieldsList;
  } else {
    throw Exception('Failed to load data');
  }
}

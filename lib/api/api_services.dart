import 'dart:convert';

import 'package:appdoa/api/data_model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<DataDoa>> getAllData() async {
    final response = await http
        .get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => DataDoa.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }


}

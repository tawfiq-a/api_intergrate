import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/device_model.dart';

class ApiClient {
  final String baseUrl = "https://api.restful-api.dev";

  Future<List<DeviceDetails>> getData() async {
    final response = await http.get(Uri.parse("$baseUrl/objects"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => DeviceDetails.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load data. Status code: ${response.statusCode}");
    }
  }
}

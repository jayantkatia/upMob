import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/device.dart';
import 'api.dart';

class APIService {
  APIService({required this.api});
  final API api;
  factory APIService.init() => APIService(api: API());

  Future<List<Device>> getDevices(http.Client client) async {
    final response = await client.get(api.getDevicesURI());

    if (response.statusCode == 200 && response.body.isEmpty) {
      throw Exception('No Data Found');
    } else if (response.statusCode == 200) {
      List? devices = json.decode(response.body);
      if (devices != null && devices.length != 0) return devices.map((device) => Device.fromJson(device)).toList();
      throw Exception('No devices retrieved from json');
    }

    print('Request ${api.getDevicesURI()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw Exception('Failed to get devices');
  }
}

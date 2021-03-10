import 'package:flutter/material.dart';

class Device {
  final String deviceName;
  final String expected;
  final String imgURL;
  final String sourceURL;
  final int price;
  final int specScore;
  Device(
      {required this.deviceName,
      required this.expected,
      required this.imgURL,
      required this.price,
      required this.sourceURL,
      required this.specScore});

  @override
  String toString() => "Device Name: ${this.deviceName}, Price: Rs. ${this.price}, SourceURL: ${this.sourceURL}";

  factory Device.fromJson(Map<String, dynamic> json) {
    String expected = parseExpectedDate(json['expected']);
    return Device(
        deviceName: json['device_name'],
        expected: expected,
        imgURL: json['img_url'],
        sourceURL: json['source_url'],
        price: json['price'],
        specScore: json['spec_score']);
  }
}

@visibleForTesting
String parseExpectedDate(String expected) {
  // received format:: "Expected Launch:May" 2021  OR "-"
  // desired format:: "Launch : May 2021"
  if (expected != "-" && expected != "") {
    List<String> splitList = expected.split(":");
    return "Launch : " + splitList[1];
  }
  return "";
}

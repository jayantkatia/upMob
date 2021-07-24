import 'package:flutter/material.dart';

class Device {
  final String deviceName;
  final String expected;
  final String imgURL;
  final String sourceURL;
  final int price;
  final int specScore;
  final String lastUpdated;
  final Map<String, String?> keySpecs;
  final Map<String, String?> general;
  final Map<String, String?> performance;
  final Map<String, String?> display;
  final Map<String, String?> networks;
  final Map<String, String?> storage;
  final Map<String, String?> frontCamera;
  final Map<String, String?> rearCamera;
  final Map<String, String?> sensors;
  final Map<String, String?> battery;
  final String scrapeTimestamp;

  Device({
    required this.deviceName,
    required this.expected,
    required this.imgURL,
    required this.price,
    required this.sourceURL,
    required this.specScore,
    required this.lastUpdated,
    required this.keySpecs,
    required this.general,
    required this.performance,
    required this.display,
    required this.networks,
    required this.storage,
    required this.frontCamera,
    required this.rearCamera,
    required this.sensors,
    required this.battery,
    required this.scrapeTimestamp,
  });

  @override
  String toString() => "Device Name: ${this.deviceName}, Price: Rs. ${this.price}, SourceURL: ${this.sourceURL}";

  factory Device.fromJson(Map<String, dynamic> json) {
    // String expected = parseExpectedDate(json['expected']);
    return Device(
        deviceName: json['device_name'],
        lastUpdated: json['last_updated'],
        expected: json['expected'],
        imgURL: json['img_url'],
        sourceURL: json['source_url'],
        price: json['price'],
        specScore: json['spec_score'],
        keySpecs: {
          "RAM": returnValue(json['ram']),
          "Processor": returnValue(json['processor']),
          "Display": returnValue(json['display']),
          "Front Camera": returnValue(json['front_camera']),
          "Rear Camera": returnValue(json['rear_camera']),
          "Battery": returnValue(json['battery'])
        },
        general: {"Custom UI": returnValue(json['custom_ui']), "Operating System": returnValue(json['operating_system'])},
        performance: {
          "Architecture": returnValue(json['architecture']),
          "CPU": returnValue(json['cpu']),
          "Graphics": returnValue(json['graphics']),
          "Chipset": returnValue(json['chipset'])
        },
        display: {
          "Screen Size": returnValue(json['screen_size']),
          "Resolution": returnValue(json['resolution']),
          "Pixel Density": returnValue(json['pixel_density']),
          "Touchscreen": returnValue(json['touchscreen']),
          "Display Type": returnValue(json['display_type'])
        },
        storage: {
          "Internal Memory": returnValue(json['internal_memory']),
          "Expandable Memory": returnValue(json['expandable_memory']),
        },
        rearCamera: {
          "Camera Setup": returnValue(json['m_camera_setup']),
          "Resolution": returnValue(json['m_resolution']),
          "Auto Focus": returnValue(json['m_autofocus']),
          "OIS": returnValue(json['m_ois']),
          "Sensors": returnValue(json['m_sensors']),
          "Flash": returnValue(json['m_flash']),
          "Image Resolution": returnValue(json['m_image_resolution']),
          "Settings": returnValue(json['m_settings']),
          "Shooting Modes": returnValue(json['m_shooting_modes']),
          "Camera Features": returnValue(json['m_camera_features']),
          "Video Recording": returnValue(json['m_video_recording']),
        },
        frontCamera: {
          "Camera Setup": returnValue(json['s_camera_setup']),
          "Resolution": returnValue(json['s_resolution']),
          "Video Recording": returnValue(json['s_video_recording']),
        },
        battery: {
          "Capacity": returnValue(json['capacity']),
          "Removable Battery": returnValue(json['removable_battery']),
          "Wireless Charging": returnValue(json['wireless_charging']),
          "Quick Charging": returnValue(json['quick_charging']),
          "USB Type-C": returnValue(json['usb'])
        },
        networks: {
          "Sim Slot(s)": returnValue(json['sim_slots']),
          "Network Support": returnValue(json['network_support']),
        },
        sensors: {
          "Fingerprint Sensors": returnValue(json['fingerprint_sensor']),
          "Other Sensors": returnValue(json['other_sensors']),
        },
        scrapeTimestamp: json['scrape_timestamp']);
  }

  Map<String, dynamic> toMap() {
    return {
      "device_name": deviceName,
      "last_updated": lastUpdated,
      "expected": expected,
      "price": price,
      "img_url": imgURL,
      "source_url": sourceURL,
      "spec_score": specScore,
      "ram": keySpecs["RAM"],
      "processor": keySpecs["Processor"],
      "front_camera": keySpecs["Front Camera"],
      "rear_camera": keySpecs["Rear Camera"],
      "battery": keySpecs["Battery"],
      "display": keySpecs["Display"],
      "operating_system": general["Operating System"],
      "custom_ui": general["Custom UI"],
      "chipset": performance["Chipset"],
      "cpu": performance["CPU"],
      "architecture": performance["Architecture"],
      "graphics": performance["Graphics"],
      "display_type": display["Display Type"],
      "screen_size": display["Screen Size"],
      "resolution": display["Resolution"],
      "pixel_density": display["Pixel Density"],
      "touchscreen": display["Touchscreen"],
      "internal_memory": storage["Internal Memory"],
      "expandable_memory": storage["Expandable Memory"],
      "m_camera_setup": rearCamera["Camera Setup"],
      "m_resolution": rearCamera["Resolution"],
      "m_autofocus": rearCamera["Auto Focus"],
      "m_ois": rearCamera["OIS"],
      "m_sensors": rearCamera["Sensors"],
      "m_flash": rearCamera["Flash"],
      "m_image_resolution": rearCamera["Image Resolution"],
      "m_settings": rearCamera["Settings"],
      "m_shooting_modes": rearCamera["Shooting Modes"],
      "m_camera_features": rearCamera["Camera Features"],
      "m_video_recording": rearCamera["Video Recording"],
      "s_camera_setup": frontCamera["Camera Setup"],
      "s_resolution": frontCamera["Resolution"],
      "s_video_recording": frontCamera["Video Recording"],
      "capacity": battery["Capacity"],
      "usb": battery["USB Type-C"],
      "removable_battery": battery["Removable Battery"],
      "wireless_charging": battery["Wireless Charging"],
      "quick_charging": battery["Quick Charging"],
      "sim_slots": networks["Sim Slot(s)"],
      "network_support": networks["Network Support"],
      "fingerprint_sensor": sensors["Fingerprint Sensors"],
      "other_sensors": sensors["Other Sensors"],
      "scrape_timestamp": scrapeTimestamp
    };
  }
}

String? returnValue(dynamic value) {
  if (value is Map) {
    if (value['Valid']) return value['String'];
    return null;
  }
  return value;
}

class KeySpecs {
  final String? ram;
  final String? processor;
  final String? frontCamera;
  final String? rearCamera;
  final String? display;
  final String? battery;
  KeySpecs({this.ram, this.processor, this.frontCamera, this.rearCamera, this.battery, this.display});

  factory KeySpecs.fromJSON(Map<String, dynamic> json) {
    return KeySpecs(
      battery: returnValue(json["battery"]),
      display: returnValue(json["display"]),
      frontCamera: returnValue(json["front_camera"]),
      processor: returnValue(json["processor"]),
      ram: returnValue(json["ram"]),
      rearCamera: returnValue(json["rear_camera"]),
    );
  }
}

class General {
  final String? customUI;
  final String? operatingSystems;

  General({this.customUI, this.operatingSystems});

  factory General.fromJSON(Map<String, dynamic> json) {
    return General(customUI: returnValue(json['custom_ui']), operatingSystems: returnValue(json['operating_system']));
  }
}

class Performance {
  final String? chipset;
  final String? cpu;
  final String? architecture;
  final String? graphics;

  Performance({this.chipset, this.cpu, this.architecture, this.graphics});

  factory Performance.fromJSON(Map<String, dynamic> json) {
    return Performance(
        architecture: returnValue(json['architecture']),
        chipset: returnValue(json['chipset']),
        cpu: returnValue(json['cpu']),
        graphics: returnValue(json['graphics']));
  }
}

class Display {
  final String? displayType;
  final String? screenSize;
  final String? resolution;
  final String? pixelDensity;
  final String? touchScreen;

  Display({this.displayType, this.screenSize, this.resolution, this.pixelDensity, this.touchScreen});

  factory Display.fromJSON(Map<String, dynamic> json) {
    return Display(
        displayType: returnValue(json['display_type']),
        pixelDensity: returnValue(json['pixel_density']),
        screenSize: returnValue(json['screen_size']),
        resolution: returnValue(json['resolution']),
        touchScreen: returnValue(json['touchscreen']));
  }
}

class Sensors {
  final String? fingerprintSensor;
  final String? otherSensors;

  Sensors({this.fingerprintSensor, this.otherSensors});

  factory Sensors.fromJSON(Map<String, dynamic> json) {
    return Sensors(fingerprintSensor: returnValue(json['fingerprint_sensor']), otherSensors: returnValue(json['other_sensor']));
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

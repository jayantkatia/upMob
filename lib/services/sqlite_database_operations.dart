import 'package:sqflite/sqflite.dart';
import 'package:upcoming_mobiles_frontend/model/device.dart';

Future<void> insertDevice(Device device, Database database) async {
  await database.insert(
    'devices',
    device.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteDevice(String deviceName, Database database) async {
  await database.delete('devices', where: "device_name=?", whereArgs: [deviceName]);
}

Future<List<Device>> getDevices(Database database) async {
  final List<Map<String, dynamic>> maps = await database.query('devices');
  return List.generate(maps.length, (i) {
    return Device.fromJson(maps[i]);
  });
}

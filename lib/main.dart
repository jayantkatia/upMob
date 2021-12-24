import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:upcoming_mobiles_frontend/model/device.dart';
import 'package:upcoming_mobiles_frontend/screens/homepage.dart';
import 'package:upcoming_mobiles_frontend/services/sqlite_database_operations.dart';
import 'package:upcoming_mobiles_frontend/widgets/inherited_database.dart';

void main() async {
  // Load ebvironment variables
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'UpMob_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE devices ("device_name" TEXT PRIMARY KEY,"last_updated" TEXT NOT NULL,"expected" TEXT NOT NULL,"price" int NOT NULL,"img_url" TEXT NOT NULL,"source_url" TEXT NOT NULL,"spec_score" int NOT NULL,"ram" TEXT,"processor" TEXT,"front_camera" TEXT,"rear_camera" TEXT,"battery" TEXT,"display" TEXT,"operating_system" TEXT,"custom_ui" TEXT, "chipset" TEXT,"cpu" TEXT,"architecture" TEXT,"graphics" TEXT,"display_type" TEXT,"screen_size" TEXT,"resolution" TEXT,"pixel_density" TEXT,"touchscreen" TEXT,"internal_memory" TEXT,"expandable_memory" TEXT,"m_camera_setup" TEXT,"m_resolution" TEXT,"m_autofocus"	TEXT,"m_ois" TEXT,"m_sensors"	TEXT,"m_flash" TEXT,"m_image_resolution" TEXT,"m_settings" TEXT,"m_shooting_modes" TEXT,"m_camera_features" TEXT,"m_video_recording" TEXT,"s_camera_setup" TEXT,"s_resolution" TEXT,"s_video_recording" TEXT,"capacity" TEXT,"removable_battery" TEXT,"wireless_charging" TEXT,"quick_charging" TEXT,"usb" TEXT,"sim_slots" TEXT,"network_support" TEXT,"fingerprint_sensor" TEXT,"other_sensors" TEXT,"scrape_timestamp" timestamp NOT NULL);');
    },
    version: 1,
  );
  List<Device> devices = await getDevices(database);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) => runApp(InheritedDatabase(
        child: MyApp(devices: devices),
        database: database,
      )));
}

class MyApp extends StatelessWidget {
  final List<Device> devices;

  const MyApp({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeviceProvider>(
      create: (context) => DeviceProvider(devices: devices),
      child: MaterialApp(
        title: 'Upcoming Mobiles',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.grey[100],
            brightness: Brightness.light,
            fontFamily: 'GoogleSans',
            textTheme: TextTheme().copyWith(headline6: TextTheme().headline6?.copyWith(fontSize: 18)),
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent)),
        home: MyHomePage(),
      ),
    );
  }
}

class DeviceProvider with ChangeNotifier {
  List<Device> devices;
  DeviceProvider({required this.devices});

  setDevices(List<Device> newDevices) {
    devices = newDevices;
    notifyListeners();
  }
}

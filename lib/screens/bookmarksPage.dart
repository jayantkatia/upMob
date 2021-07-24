import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:upcoming_mobiles_frontend/main.dart';
import 'package:upcoming_mobiles_frontend/model/device.dart';
import 'package:upcoming_mobiles_frontend/widgets/device_card.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Database database;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Device> devices = Provider.of<DeviceProvider>(context).devices;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmarks",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: devices.length != 0
          ? ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) => DeviceCard(device: devices[index]),
            )
          : Center(
              child: Text(
                "No Bookmarks",
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}

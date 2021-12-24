import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:upcoming_mobiles_frontend/main.dart';
import 'package:upcoming_mobiles_frontend/model/device.dart';
import 'package:upcoming_mobiles_frontend/services/sqlite_database_operations.dart';
import 'package:upcoming_mobiles_frontend/widgets/detail_card.dart';
import 'package:upcoming_mobiles_frontend/widgets/inherited_database.dart';

class DetailsPage extends StatefulWidget {
  final Device device;
  DetailsPage({required this.device});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  IconData notBookmarked = Icons.bookmark_border;
  IconData bookmarked = Icons.bookmark;
  bool isBookMarked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devices = Provider.of<DeviceProvider>(context, listen: false).devices;
    if (devices.any((device) => device.deviceName == widget.device.deviceName)) isBookMarked = true;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.device.deviceName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => _toggleBookMark(context, devices),
            icon: Icon(isBookMarked ? bookmarked : notBookmarked),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(flex: 4, child: Image.network(widget.device.imgURL)),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.device.deviceName,
                          style: Theme.of(context).textTheme.headline6,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Rs. " + widget.device.price.toString(),
                              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.red)),
                        ),
                        Text(
                          widget.device.expected,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: widget.device.specScore != 0
                              ? Row(children: [
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green, width: 3)),
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Center(
                                      child: Text(widget.device.specScore.toString(),
                                          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.green[700])),
                                    ),
                                  ),
                                  Text(
                                    "Spec Score",
                                    style: TextStyle(fontSize: 18, color: Colors.green[800]),
                                  )
                                ])
                              : Container(
                                  height: 0,
                                ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              DetailsCard(title: "Key Specs", info: widget.device.keySpecs),
              DetailsCard(title: "General", info: widget.device.general),
              DetailsCard(title: "Performance", info: widget.device.performance),
              DetailsCard(title: "Display", info: widget.device.display),
              DetailsCard(title: "Battery", info: widget.device.battery),
              DetailsCard(title: "Front Camera", info: widget.device.frontCamera),
              DetailsCard(title: "Rear Camera", info: widget.device.rearCamera),
              DetailsCard(title: "Storage", info: widget.device.storage),
              DetailsCard(title: "Networks & Connectivity", info: widget.device.networks),
              DetailsCard(title: "Sensors", info: widget.device.sensors),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleBookMark(BuildContext context, List<Device> devices) {
    final Database database = InheritedDatabase.of(context).database;
    if (isBookMarked) {
      deleteDevice(widget.device.deviceName, database).then((value) => {
            setState(() {
              isBookMarked = false;
            })
          });
      devices.removeWhere((device) => device.deviceName == widget.device.deviceName);
      Provider.of<DeviceProvider>(context, listen: false).setDevices(devices);
    } else {
      insertDevice(widget.device, database).then((value) => {
            setState(() {
              isBookMarked = true;
            })
          });
      devices.add(widget.device);
      Provider.of<DeviceProvider>(context, listen: false).setDevices(devices);
    }
  }
}

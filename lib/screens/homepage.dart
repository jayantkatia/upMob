import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upcoming_mobiles_frontend/screens/bookmarksPage.dart';

import '../model/device.dart';
import '../widgets/device_card.dart';
import '../services/api_services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final APIService apiService = APIService.init();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Upcoming Mobiles",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookmarksPage())),
              icon: Icon(Icons.bookmarks_rounded),
            ),
          ],
        ),
        body: FutureBuilder<List<Device>>(
          future: apiService.getDevices(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError && !(snapshot.data is Exception)) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => DeviceCard(device: snapshot.data![index]),
                ),
              );
            } else if (snapshot.hasError || (snapshot.data is Exception)) {
              print(snapshot.data);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 64,
                    ),
                    Text(
                      "Error !!",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

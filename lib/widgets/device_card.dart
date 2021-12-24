import 'package:flutter/material.dart';
import 'package:upcoming_mobiles_frontend/screens/detailsPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/device.dart';

class DeviceCard extends StatelessWidget {
  DeviceCard({required this.device});
  final Device device;

  void _launchURL(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(device: device))),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey[400],
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(flex: 2, child: Image.network(device.imgURL)),
                  Flexible(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      device.deviceName,
                                      style: Theme.of(context).textTheme.headline6,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text("Rs. " + device.price.toString(),
                                          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.red)),
                                    ),
                                    Text(
                                      device.expected,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: device.specScore != 0
                                    ? Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green, width: 3)),
                                        width: 50,
                                        height: 50,
                                        child: Center(
                                          child: Text(device.specScore.toString(),
                                              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.green[700])),
                                        ),
                                      )
                                    : Container(
                                        height: 0,
                                      ))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL("https://google.com/news?q=" + device.deviceName.replaceAll(RegExp(" "), "%20"));
                            print("https://google.com?search/q=" + device.deviceName.replaceAll(RegExp(" "), "%20"));
                          },
                          child: Text(
                            "Search for more updates",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

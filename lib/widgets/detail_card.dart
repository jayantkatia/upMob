import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final Map<String, String?> info;
  DetailsCard({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5,
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Column(children: getSpecsList(info))
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getSpecsList(Map<String, String?> info) {
  List keys = info.keys.toList();
  return keys
      .map((key) => info[key] == null
          ? Container(
              height: 0,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 150),
                          child: Text(
                            key,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )),
                  Flexible(
                      flex: 4,
                      child: Text(
                        info[key] ?? "",
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ))
      .toList();
}

import 'dart:convert';

import 'package:assingment/widgets/performanceElements.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Performance extends StatefulWidget {
  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  List<PerformanceElements> list = [];

  bool loaded = false;

  Future<void> setData() async {
    var url =
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";
    var response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body) as List;
    body.forEach((element) {
      var temp = 0.0;
      temp = element['ChangePercent'];
      list.add(PerformanceElements(element['Label'], temp.toStringAsFixed(1)));
    });
  }

  @override
  void initState() {
    loaded = false;
    setData().then((_) {
      setState(() {
        loaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Performance",
                style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => list[index]),
              )
            ],
          ))
        : Padding(
            padding: EdgeInsets.only(
                left: 200, top: MediaQuery.of(context).size.height / 2),
            child: CircularProgressIndicator(),
          );
  }
}

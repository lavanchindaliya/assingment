import 'dart:convert';

import 'package:assingment/widgets/overViewText.dart';
import 'package:assingment/widgets/rightOverViewText.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OverView extends StatefulWidget {
  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  var loaded = false;
  var sector = "";

  var industry = "";

  var marketCap = 0.0;

  var EnterPriseValue = "";

  var BookValue = 0.0;

  var PriceEarning = 0.0;

  var PEG = 0.0;

  var Dividend = 0.0;

  Future<void> setData() async {
    var url =
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body) as Map;
    sector = data['Sector'];
    industry = data['Industry'];
    marketCap = data['MCAP'];
    EnterPriseValue = data['EV'] != null ? data['EV'] : "";
    BookValue = data['BookNavPerShare'];
    PriceEarning = data['TTMPE'];
    PEG = data['PEGRatio'];
    Dividend = data['Yield'];
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
                'Overview',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[800]),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Sector'),
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance,
                        color: Colors.lime[800],
                      ),
                      ROverViewText(sector),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Industry'),
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance,
                        color: Colors.lime[800],
                      ),
                      ROverViewText(industry),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Market Cap'),
                  ROverViewText(marketCap.toStringAsFixed(2) + ' Cr')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Enterprise Value(EV)'),
                  ROverViewText(EnterPriseValue)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Book value/Share'),
                  ROverViewText(BookValue.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Price-Earning Ratio(PE)'),
                  ROverViewText(PriceEarning.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('PEG'),
                  ROverViewText(PEG.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverViewText('Dividend'),
                  ROverViewText(Dividend.toStringAsFixed(2))
                ],
              ),
              Row(
                children: [
                  Expanded(child: OverViewText("")),
                  Text(
                    'View More',
                    style: TextStyle(fontSize: 15, color: Colors.lime[800]),
                  )
                ],
              )
            ],
          ))
        : Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: CircularProgressIndicator(),
          );
  }
}

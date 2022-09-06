import 'package:flutter/material.dart';

class PerformanceElements extends StatelessWidget {
  String leading;
  String value;

  PerformanceElements(this.leading, this.value);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            leading,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
        Bar(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_drop_up,
                color: Colors.green[800],
              ),
              Text(
                value + ' %',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[800]),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 120,
        height: 15,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      ),
      Container(
        width: 40,
        height: 15,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(5)),
      ),
    ]);
  }
}

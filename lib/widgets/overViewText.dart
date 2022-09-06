import 'package:flutter/material.dart';

class OverViewText extends StatelessWidget {
  String data;

  OverViewText(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        style: TextStyle(
            fontSize: 15,
            color: Colors.indigo[600],
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ROverViewText extends StatelessWidget {
  String data;

  ROverViewText(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}

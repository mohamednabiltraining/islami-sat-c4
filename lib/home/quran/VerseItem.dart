import 'package:flutter/material.dart';

class VerseItem extends StatelessWidget {
  String text;
  int index;

  VerseItem(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        text + '{${index + 1}}',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

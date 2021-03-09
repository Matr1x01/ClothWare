import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
      ),
    );
  }
}

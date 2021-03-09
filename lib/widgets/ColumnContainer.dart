import 'package:ClothWare/models/Item.dart';
import 'package:flutter/material.dart';
import 'ItemsBox.dart';
import 'package:ClothWare/models/Item.dart';

class ColumnContainer extends StatelessWidget {
  final double boxSize = 150;
  final String catagory;
  final List<Item> items;
  ColumnContainer(this.catagory, this.items);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            catagory,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ItemsBox(boxSize, catagory.toLowerCase(), items),
      ],
    );
  }
}

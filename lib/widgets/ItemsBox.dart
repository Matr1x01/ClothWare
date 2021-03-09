import 'package:flutter/material.dart';
import 'ItemCard.dart';
import 'package:ClothWare/models/Item.dart';

class ItemsBox extends StatelessWidget {
  final double boxSize;
  String item;
  List<Item> itemArray;
  ItemsBox(this.boxSize, this.item, this.itemArray);
  var items = List<Widget>();

  @override
  Widget build(BuildContext context) {
    int sz = itemArray.length;
    for (var i = 0; i < sz; i++) {
      items.add(ItemCard(boxSize, itemArray[i]));
    }

    return Container(
        height: boxSize + 80,
        padding: EdgeInsets.only(bottom: 20),
        child: ListView(scrollDirection: Axis.horizontal, children: items));
  }
}

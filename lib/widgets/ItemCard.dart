import 'package:flutter/material.dart';
import 'ItemPage.dart';
import 'package:ClothWare/models/Item.dart';

class ItemCard extends StatelessWidget {
  final double boxSize;
  Item item;
  ItemCard(this.boxSize, this.item);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ItemPage(item)));
      },
      child: Column(
        children: [
          Card(
            color: Theme.of(context).primaryColor,
            child: SizedBox(
              child: Container(
                alignment: Alignment.center,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Text(item.name),
                  Image.asset(
                    "assets/images/" + item.type + ".jpg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 20,
                    width: boxSize,
                    alignment: Alignment.bottomCenter,
                    color: const Color(0x20000000),
                    child: Text(
                      item.price.toString() + " TK",
                    ),
                  )
                ]),
              ),
              height: boxSize,
              width: boxSize,
            ),
          ),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}

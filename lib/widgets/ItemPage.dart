import 'package:ClothWare/main.dart';
import 'package:flutter/material.dart';
import 'package:ClothWare/models/Item.dart';

class ItemPage extends StatelessWidget {
  Item item;
  int id;
  ItemPage(this.item);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            item.name.toUpperCase(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                  child: Image.asset(
                "assets/images/" + item.type + ".jpg",
              )),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  item.price.toString() + " Tk",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(item.decription),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyApp.cart.add(item);
            print(MyApp.cart.totalCost());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

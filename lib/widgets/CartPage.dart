import 'package:flutter/material.dart';
import 'package:ClothWare/main.dart';
import 'package:ClothWare/models/Item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = MyApp.cart.getItems();
    List<Container> cartItems = [];
    for (var i = 0; i < items.length; i++) {
      cartItems.add(
        new Container(
          alignment: Alignment.center,
          child: ListTile(
            tileColor: Theme.of(context).primaryColorLight,
            visualDensity: VisualDensity.compact,
            leading: Text(
              (i + 1).toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            title: Text(
              items[i].name,
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Text(items[i].price.toString() + " Tk"),
            trailing: FlatButton(
              onPressed: () {
                setState(() {
                  MyApp.cart.removeAt(i);
                });
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          padding: EdgeInsets.all(10),
        ),
      );
    }
    cartItems.add(Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            "Total Cost: ",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.start,
          ),
          Text(
            MyApp.cart.totalCost().toString() + " Tk",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: (cartItems.length == 1)
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Cart is Empty",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView(children: cartItems),
        ));
  }
}

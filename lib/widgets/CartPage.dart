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
    double totalCost = 0;
    List<Item> items = MyApp.cart.getItems();
    Map<dynamic, dynamic> itemCount = Map.from(MyApp.cart.getItemCounts());
    List<Container> cartItems = [];
    for (var i = 0; i < items.length; i++) {
      totalCost += (items[i].price * itemCount[items[i].id.toString()]);
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
              items[i].name +
                  '(x' +
                  itemCount[items[i].id.toString()].toString() +
                  ')',
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Text((items[i].price * itemCount[items[i].id.toString()])
                    .toString() +
                "(" +
                items[i].price.toString() +
                "x" +
                itemCount[items[i].id.toString()].toString() +
                ") Tk"),
            trailing: TextButton(
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
            totalCost.toString() + " Tk",
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

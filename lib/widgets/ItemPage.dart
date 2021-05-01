import 'package:ClothWare/main.dart';
import 'package:flutter/material.dart';
import 'package:ClothWare/models/Item.dart';

class ItemPage extends StatefulWidget {
  final Item item;

  ItemPage(this.item);

  @override
  _ItemPageState createState() => _ItemPageState(item);
}

class _ItemPageState extends State<ItemPage> {
  int id;
  Item item;
  int count = 0;

  _ItemPageState(this.item);

  @override
  void initState() {
    super.initState();
    intiCount();
  }

  void intiCount() {
    if (MyApp.cart.getItemCount(item.id) != null) {
      count = MyApp.cart.getItemCount(item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.item.name.toUpperCase(),
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
                  "assets/images/" + widget.item.type + ".jpg",
                )),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    widget.item.price.toString() + " Tk",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(widget.item.decription),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              color: Colors.white60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.cyanAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        child:
                            Text("+", style: TextStyle(color: Colors.white))),
                    Text(
                      count.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          if (count > 0) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                      onPressed: () {
                        MyApp.cart.add(widget.item, count);
                      },
                      // child: Icon(Icons.add),
                      child: Text("ADD TO CART"),
                    ),
                  ]))),
    );
  }
}

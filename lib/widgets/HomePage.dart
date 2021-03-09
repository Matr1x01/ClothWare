import 'package:flutter/material.dart';
import 'ColumnContainer.dart';
import 'package:ClothWare/models/Data.dart';
import 'package:ClothWare/models/Item.dart';

class HomePage extends StatelessWidget {
  Data data = new Data();
  String item;
  var items = List<Widget>();
  @override
  Widget build(BuildContext context) {
    List<String> itemsCatagory = ["Shirt", "Pant", "Shoe", "Accessories"];
    return Container(
      child: FutureBuilder<List<Item>>(
        future: data.fetchShopData(),
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            int sz = snapshot.data.length;
            int types = itemsCatagory.length;
            List<List> dataArray = [];

            // for (var i = 0; i < sz; i++) {
            //   print(snapshot.data[i].name);
            // }
            // return null;

            for (var i = 0; i < types; i++) {
              List<Item> temp = [];
              for (var j = 0; j < sz; j++) {
                if (snapshot.data[j].type == itemsCatagory[i].toLowerCase()) {
                  temp.add(snapshot.data[j]);
                }
              }
              dataArray.add(temp);
            }
            List<ColumnContainer> columnContainerArray = [];
            for (var i = 0; i < types; i++) {
              columnContainerArray
                  .add(ColumnContainer(itemsCatagory[i], dataArray[i]));
            }
            return Container(
              color: Theme.of(context).backgroundColor,
              child: ListView(
                children: columnContainerArray,
              ),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

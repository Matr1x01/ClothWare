import 'dart:collection';
import 'Item.dart';

class Cart {
  Queue cart = new Queue();
  var itemCount = {};
  void add(Item item, int count) {
    cart.removeWhere((element) {
      if (element.id == item.id) {
        return true;
      } else {
        return false;
      }
    });
    cart.add(item);
    itemCount[item.id.toString()] = count;
  }

  void remove(int id) {
    cart.removeWhere((element) {
      if (element.id == id) {
        return true;
      } else {
        return false;
      }
    });
  }

  void removeAt(int i) {
    int id = cart.elementAt(i).id;
    cart.removeWhere((element) {
      if (element.id == id) {
        return true;
      } else {
        return false;
      }
    });
  }

  Map<dynamic, dynamic> getItemCounts() {
    return itemCount;
  }

  int getItemCount(int id) {
    return itemCount[id.toString()];
  }

  int length() {
    return cart.length;
  }

  List<Item> getItems() {
    List<Item> items = [];
    for (var i = 0; i < cart.length; i++) {
      items.add(cart.elementAt(i));
    }
    return items;
  }
}

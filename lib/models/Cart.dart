import 'dart:collection';
import 'Item.dart';

class Cart {
  Queue cart = new Queue();

  void add(Item item) {
    cart.add(item);
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

  int length() {
    return cart.length;
  }

  double totalCost() {
    double sum = 0;
    for (var i = 0; i < cart.length; i++) {
      sum += cart.elementAt(i).price;
    }
    return sum;
  }

  List<Item> getItems() {
    List<Item> items = [];
    for (var i = 0; i < cart.length; i++) {
      items.add(cart.elementAt(i));
    }
    return items;
  }
}

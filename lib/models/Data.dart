import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Item.dart';
import 'User.dart';

class Data {
  List<Item> item;
  List<User> user;
  Future<List<Item>> fetchShopData() async {
    var data;
    var url = 'https://fluttermysql001.000webhostapp.com/get_data.php';
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    int sz = data.length;
    this.item = new List(sz);
    for (var i = 0; i < sz; i++) {
      Item it = (new Item(int.parse(data[i]['id']), data[i]['type'],
          data[i]['name'], double.parse(data[i]['price']), data[i]['info']));
      this.item[i] = it;
    }
    return item;
  }

  Future<List<User>> fetchUserData() async {
    var data;
    var url = 'https://fluttermysql001.000webhostapp.com/get_user.php';
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    int sz = data.length;
    this.item = new List(sz);
    for (var i = 0; i < sz; i++) {
      User it = (new User(int.parse(data[i]['id']), data[i]['name'],
          data[i]['email'], data[i]['password']));
      this.user[i] = it;
    }
    return user;
  }
}

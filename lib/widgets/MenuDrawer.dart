import 'package:flutter/material.dart';
import 'package:ClothWare/widgets/CartPage.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75.0),
                        child: Icon(
                          Icons.face,
                          size: 50,
                        ),
                      ),
                      radius: 80,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Cart"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}

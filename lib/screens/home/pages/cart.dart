import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 20.0,
        title: Text('AgriCart'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){})
        ],
        backgroundColor: Color(0xFF388E3C),
      ),
    );
  }
}

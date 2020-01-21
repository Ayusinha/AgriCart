import 'package:ecom/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecom/screens/home/components/products.dart';
import 'package:ecom/screens/home/components/horizontal_list_view.dart';
import 'package:ecom/screens/home/pages/cart.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/m4.jpg'),
          AssetImage('images/m3.jpg'),
          AssetImage('images/c21.jpg'),
        ],
        autoplay: true,

        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 4.0,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 20.0,
        title: Text('AgriCart'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          }),
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text('Logout'),
              color: Colors.white,
          ),
        ],
        backgroundColor: Color(0xFF388E3C),
      ),
      drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              //header
              new Container(
                color:Colors.green,
                child: new UserAccountsDrawerHeader(
                  accountName: Text('Patel Abhishek'),
                  accountEmail: Text('patel@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.green, size: 45,),
                    ),
                  ),
                  decoration: new BoxDecoration(
                    color: Color(0xFF388E3C),
                  ),
                ),

              ),
              InkWell(
                  onTap: (){},
                  child: ListTile(
                      title: Text('Home Page'),
                      leading: Icon(Icons.home, color: Color(0xFF388E3C),)
                  )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                      title: Text('My Account'),
                      leading: Icon(Icons.account_circle, color: Color(0xFF388E3C),)
                  )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                      title: Text('My Orders'),
                      leading: Icon(Icons.shopping_basket, color: Color(0xFF388E3C),)
                  )
              ),

              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                  },
                  child: ListTile(
                      title: Text('My Shopping Cart'),
                      leading: Icon(Icons.shopping_cart, color: Color(0xFF388E3C),)
                  )
              ),

              Divider(),


              InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      title: Text('About'),
                      leading: Icon(Icons.help, color: Color(0xFF388E3C),)
                  )
              )
            ],
          )
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Categories', style: TextStyle(fontSize: 20.0),)),
          Divider(),

          //Horizontal List View starts from here
          HorizontalListView(),
          Divider(),
          new Padding(padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 20.0),
              child: new Text('Recent Products', style: TextStyle(fontSize: 20.0),)),

          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}

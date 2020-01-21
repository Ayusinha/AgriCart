import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ProductDetails extends StatefulWidget {

  final product_details_name;
  final product_details_picture;
  final product_details_price;
  final product_farmer_name;
  final product_farmer_contact;
  final product_farmer_address;

  ProductDetails({
   this.product_details_name,
   this.product_details_picture,
   this.product_details_price,
   this.product_farmer_name,
   this.product_farmer_contact,
   this.product_farmer_address,
});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 5.0,
        title: Text('AgriCart'),
        actions: <Widget>[
          new IconButton(icon: Icon(
              Icons.search,
              color: Colors.white),
              onPressed: (){}),
          new IconButton(icon: Icon(
              Icons.shopping_cart, color: Colors.white), onPressed: (){})
        ],
        backgroundColor: Color(0xFF388E3C),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_picture),
                ),
              footer: new Container(
                height: 35.0,
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_details_name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19.0, color: Colors.black87),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(child: new Text('${widget.product_details_price}',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23.0, color: Colors.green), textAlign: TextAlign.right,)),

                    ],
                  ),
                )
              ),
            ),
          ),
          Divider(),

          //===================The First Buttons========================//

          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                  return new AlertDialog(
                  title: Text('Quantity'),
                    content: Text('Choose the quantity'),
                    actions: <Widget>[
                      new MaterialButton(onPressed: (){
                        Navigator.of(context).pop(context);
                      },
                      child: Text('Close')),
                    ],
                  );
    },);
    },
              color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Quantity"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              )),
            ],
          ),
          //=============Second Buttons===============
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0,10.0 ),
            child: Row(
              children: <Widget>[
                Expanded(child: MaterialButton(onPressed: (){},
                  height: 50.0,
                  elevation: 0.5,
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Buy Now", textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                )),
                new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.green,), onPressed: (){}),
              ],
            ),
          ),
          Divider(color: Colors.black87,),
          new ListTile(
            leading: new IconButton(icon: Icon(Icons.person, size: 35.0, color: Colors.green,), onPressed: null),
            title: Text('${widget.product_farmer_name}', style: TextStyle(fontSize: 20.0),),
            subtitle: Text('Address: ${widget.product_farmer_address}'),
            trailing: new IconButton(icon: Icon(Icons.call, color: Color(0xFF388E3C),), onPressed: ()=>
                UrlLauncher.launch('tel:+${widget.product_farmer_contact.toString()}')),
          ),
          Divider(color: Colors.black87,),
          new ListTile(
            title: Text('Product Details', style: TextStyle(fontSize: 20.0),),
            subtitle: Text(
              'This is the finest quality of wheat ever produced. Grown in the fertile lands of Madhya Pradesh, these grains will nourish your body like never before.',style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:ecom/screens/home/pages/product_details.dart';
import 'package:url_launcher/url_launcher.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Wheat",
      "farmer": 'Nandkishor',
      "contact": '+919999999990',
      "picture": "images/products/c1.jpg",
      "price": "50₹/Kg",
      "address": "Hatpipliya"
    },
    {
      "name": "Onion",
      "farmer": 'Ram',
      "contact": '+919999999991',
      "picture": "images/products/c2.jpg",
      "price": "120₹/Kg",
      "address": "Narwar"
    },
    {
      "name": "Eggs",
      "farmer": 'Sanjay',
      "contact": '+919999999992',
      "picture": "images/products/egg.jpg",
      "price": "36₹/dozen",
      "address": "Bhopal"
    },
    {
      "name": "Rice",
      "farmer": 'Nandkishor',
      "contact": '+919999999993',
      "picture": "images/products/rice.jpg",
      "price": "70₹/Kg",
      "address": "Dewas"
    },
    {
      "name": "Apples",
      "farmer": 'Nandkishor',
      "contact": '+919999999994',
      "picture": "images/products/apples.jpg",
      "price": "30₹/Kg",
      "address": "Hatpipliya"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products_list.length,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: products_list[index]['name'],
            prod_picture: products_list[index]['picture'],
            prod_price: products_list[index]['price'],
            prod_farmer_name: products_list[index]['farmer'],
            prod_farmer_contact: products_list[index]['contact'],
            prod_farmer_address: products_list[index]['address'],
          );
        }
        );
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_farmer_name;
  final prod_farmer_contact;
  final prod_farmer_address;
  Single_prod({
   this.prod_name,
   this.prod_picture,
   this.prod_price,
    this.prod_farmer_name,
    this.prod_farmer_contact,
    this.prod_farmer_address,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: prod_name, child: Material(
        child: InkWell(
          onTap: ()=> Navigator.of(context).push(
              new MaterialPageRoute(builder: (context)=> new ProductDetails(
                //Passing values of products
                product_details_name: prod_name,
                product_details_picture: prod_picture,
                product_details_price: prod_price,
                product_farmer_name: prod_farmer_name,
                product_farmer_address: prod_farmer_address,
                product_farmer_contact: prod_farmer_contact,
              ))),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text("${prod_price}", style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF388E3C)), textAlign: TextAlign.right,),
                ),
              ),
            child: Image.asset(prod_picture,
            fit: BoxFit.cover,),),
          ),
        )
      )),
    );
  }
}


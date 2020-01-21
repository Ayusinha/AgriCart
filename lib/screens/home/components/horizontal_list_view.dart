import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
        Category(
          image_location: 'images/cats/crop.png',
          image_caption: 'Crops',
        ),
          Category(
            image_location: 'images/cats/cow.png' ,
            image_caption: 'Dairy',
          ),
          Category(
            image_location: 'images/cats/hen.png',
            image_caption: 'Poultry',
          ),
          Category(
            image_location: 'images/cats/crop.png',
            image_caption: 'Crops',
          ),
        ],
      )
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_caption,
    this.image_location,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 20.0),
    child: InkWell(onTap: (){},
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(image_location,
            width: 100.0,
          height: 100.0,),
          subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption)),
        ),
      )
      ),
    );
  }
}


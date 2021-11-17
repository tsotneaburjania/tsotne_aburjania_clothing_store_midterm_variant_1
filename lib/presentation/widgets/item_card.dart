import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/clothes.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/detail_blueprint.dart';

class ItemCard extends StatefulWidget {

  // final int id;
  // final String imageLink;
  // final String name;
  // final String size;
  // final double price;
  // final String description;

  final int index;
  final Clothes clothes;


  const ItemCard({Key? key, required this.clothes, required this.index}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  // String placeHolder = "";
  // String imageLink = "";
  // String name = "";
  // double price = 0;
  // int index = 0;

  // var clothesTemplate;

  // @override
  // void initState() {
  //   super.initState();
  //   // clothesTemplate = widget.clothes;
  //   // clothesTemplate = Clothes(id: widget.id, name: widget.name, imageUrl: widget.imageLink, size: widget.size, price: widget.price, description: widget.description);
  // }
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        Navigator.pushNamed(context, '/edit', arguments: DetailBlueprint(index: widget.index, clothes: widget.clothes));
      },
      onTap: (){
        log('$index');
        Navigator.pushNamed(context, '/details', arguments: DetailBlueprint(index: widget.index, clothes: widget.clothes));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInImage.assetNetwork(placeholder: 'assets/clothes_placeholder.png',
            image: widget.clothes.imageUrl,
            fit: BoxFit.cover,
            height: (() {
              if (MediaQuery.of(context).orientation == Orientation.portrait){
                return 250.0;
              }
              else if (MediaQuery.of(context).orientation == Orientation.landscape){
                return 100.0;
              }
            }()),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.clothes.name),
                  Text(widget.clothes.price.toString())
                ],
            ),
          ),
        ],
      ),
    );
  }
}

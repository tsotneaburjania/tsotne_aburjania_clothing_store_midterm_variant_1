import 'dart:developer';

import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/clothes.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/dummy_data.dart';

class PseudoCRUDOperations {
  static void addItem(int id, String name, String image, String size, double price, String description){
    // log('id: $id');
    // log('name: $name');
    // log('image: $image');
    // log('size: $size');
    // log('price: $price');
    // log('desc: $description');

    dummyData.add(Clothes(id: id, name: name, imageUrl: image, size: size, price: price, description: description));
  }

  static void deleteItem(int index){
    dummyData.removeAt(index);
  }

  static void editItem(index, int id, String name, String image, String size, double price, String description){

    // log('id: $id');
    // log('name: $name');
    // log('image: $image');
    // log('size: $size');
    // log('price: $price');
    // log('desc: $description');

    dummyData[index] = Clothes(id: id, name: name, imageUrl: image, size: size, price: price, description: description);
  }
}
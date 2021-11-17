import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/dummy_data.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width / 3.0;
    double cardHeight = MediaQuery.of(context).size.height / 3.3;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Clothing Store'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: dummyData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: cardWidth / cardHeight,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return ItemCard(
              index: index,
              clothes: dummyData[index],
              // index: index,
              // id: dummyData[index].id,
              // imageLink: dummyData[index].imageUrl,
              // name: dummyData[index].name,
              // price: dummyData[index].price,
              // size: dummyData[index].size,
              // description: dummyData[index].description,
            );
          },
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

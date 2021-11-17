import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/detail_blueprint.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/helper_functions.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/pseudo_crud_operations.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  int id = 0;
  String  name = "";
  String image = "";
  String size = "";
  double price = 0.0;
  String description = "";

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    final detailObject = ModalRoute.of(context)!.settings.arguments as DetailBlueprint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              removeItemDialogue(context, detailObject.index);
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: viewportHeight - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeInImage.assetNetwork(placeholder: 'assets/clothes_placeholder.png',
                  image: detailObject.clothes.imageUrl,
                  fit: BoxFit.cover,
                  height: (() {
                    if (MediaQuery.of(context).orientation == Orientation.portrait){
                      return 450.0;
                    }
                    else if (MediaQuery.of(context).orientation == Orientation.landscape){
                      return 100.0;
                    }
                  }()),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Name"),
                          Text(detailObject.clothes.name)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Price"),
                          Text(detailObject.clothes.price.toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Size"),
                          Text(detailObject.clothes.size)
                        ],
                      ),
                    ]
                  ),
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, // Set border color
                            width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        detailObject.clothes.description,
                        textAlign: TextAlign.center,
                      ),
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
}

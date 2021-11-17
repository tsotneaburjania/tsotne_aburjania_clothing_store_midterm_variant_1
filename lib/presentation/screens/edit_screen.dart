import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/clothes.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/detail_blueprint.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/pseudo_crud_operations.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  int id = 0;
  String  name = "";
  String image = "";
  String size = "";
  double price = 0.0;
  String description = "";
  final _formKey = GlobalKey<FormState>();
  bool isInitialized = false;

  DetailBlueprint detailObject = DetailBlueprint(index: 0, clothes: Clothes(id: 0, name: "", imageUrl: "", size: "", price: 0.0, description: ""));

  @override
  void didChangeDependencies() {
    // OBTAINING ROUTE ARGUMENTS ONLY ONCE.
    if (!isInitialized) {
      detailObject = ModalRoute.of(context)!.settings.arguments as DetailBlueprint;
      id = detailObject.clothes.id;
      name = detailObject.clothes.name;
      image = detailObject.clothes.imageUrl;
      size = detailObject.clothes.size;
      price = detailObject.clothes.price;
      description =  detailObject.clothes.description;
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    bool submitted = false;

    void submitFunction() {
      setState(() => submitted = true);
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        PseudoCRUDOperations.editItem(
            detailObject.index,
            id,
            name,
            image,
            size,
            price,
            description
        );
        Navigator.pushNamed(context, '/');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
          centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: viewportHeight - 100,
            child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Center(
                child: SizedBox(
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children:  [
                        TextFormField(
                          // controller: idEc..text = id.toString(),
                          initialValue: id.toString(),
                          // controller: TextEditingController()..text = detailObject.clothes.id.toString(),
                          // controller: TextEditingController(text: detailObject.clothes.id.toString()),
                          style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                          decoration: const InputDecoration(
                            hintText: 'Please enter ID',
                            filled: true,
                            contentPadding:
                            EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                          ),
                          autovalidateMode: submitted
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field shall not be left empty.';
                            }
                            return null;
                          },
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          // onChanged: (text) => setState(() => id = text as int),
                          onChanged: (idInput){
                            setState(() {
                              id = int.parse(idInput);
                            });
                            log("id $id");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: nameEc..text = name,
                            initialValue: name,
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                            decoration: const InputDecoration(
                              hintText: 'Please enter name',
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (nameInput){
                              setState(() {
                                name = nameInput;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: imageEc..text = image,
                            initialValue: image,
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                            decoration: const InputDecoration(
                              hintText: 'Please enter image',
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (imageInput){
                              setState(() {
                                image =  imageInput;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField (
                            // controller: sizeEc..text = size,
                            initialValue: size,
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                            decoration: const InputDecoration(
                              hintText: 'Please enter size',
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (sizeInput){
                              setState(() {
                                size = sizeInput;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: priceEc..text = price.toString(),
                            initialValue: price.toString(),
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                            decoration: const InputDecoration(
                              hintText: 'Please enter price',
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (priceInput){
                              log(priceInput);
                              setState(() {
                                price = double.parse(priceInput);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: descEc..text = description,
                            initialValue: description,
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, ),
                            decoration: const InputDecoration(
                              hintText: 'Please enter description',
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (descriptionInput){
                              setState(() {
                                description = descriptionInput;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text('Back', style: TextStyle(fontSize: 18.0),),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 30)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          // fixedSize: MaterialStateProperty.all<Size>(Size.square())
                        )
                    ),
                    TextButton(
                        onPressed:
                        id.toString().isNotEmpty ||
                            name.isNotEmpty ||
                            image.isNotEmpty ||
                            size.isNotEmpty ||
                            price.toString().isNotEmpty ||
                            description.isNotEmpty
                            ? submitFunction : null,

                        child: const Text('Edit', style: TextStyle(fontSize: 18.0),),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 30)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          // fixedSize: MaterialStateProperty.all<Size>(Size.square())
                        )
                    ),
                  ],
                )
              ],
            ),
        ),
          ),
    ]
      ),
    );
  }
}

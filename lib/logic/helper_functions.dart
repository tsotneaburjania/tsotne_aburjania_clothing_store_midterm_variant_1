import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/pseudo_crud_operations.dart';

removeItemDialogue(BuildContext context, int index) {

  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget removeButton = TextButton(
    child: const Text("REMOVE", style: TextStyle(color: Colors.red),),
    onPressed:  () {
      PseudoCRUDOperations.deleteItem(index);
      Navigator.pushNamed(context, '/');
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Removal"),
    content: const Text("Would you like to remove this item?"),
    actions: [
      cancelButton,
      removeButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
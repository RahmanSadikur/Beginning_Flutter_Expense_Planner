import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                  print(nameController.text);
                  print(amountController.text);
                },
                child: Text('Add TRansaction'),
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void isSave() {
    String name = nameController.text;
    double amount = double.parse(amountController.text);
    if (name.isEmpty || amount <= 0) {
      return;
    }

    widget.addtx(name, amount);
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => isSave(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => isSave(),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColorDark,
                ),
                onPressed: isSave,
                child: Text('Add TRansaction'),
              )
            ],
          )),
    );
  }
}

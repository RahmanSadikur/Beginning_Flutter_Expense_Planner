import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    if (name.isEmpty || amount <= 0 || selectedDate == null) {
      return;
    }

    widget.addtx(name, amount, selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      selectedDate = value;
    });
  }

  final nameController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

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
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(selectedDate == null
                          ? 'No Date Has Chosen'
                          : 'Picked Date: ${DateFormat.yMMMMd().format(selectedDate)}'),
                    ),
                    TextButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      child: Text('chose Date'),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: isSave,
                child: Text('Add TRansaction'),
              )
            ],
          )),
    );
  }
}

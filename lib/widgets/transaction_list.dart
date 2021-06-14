import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction_list extends StatelessWidget {
  //const Transaction_list({Key? key}) : super(key: key);

  final List<Transaction> _transaction = [
    Transaction(id: 1, name: 'abc', amount: 20.00, date: DateTime.now()),
    Transaction(id: 2, name: 'efg', amount: 30.00, date: DateTime.now()),
    Transaction(id: 3, name: 'ijk', amount: 40.00, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transaction.map((e) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$ ${e.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  e.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(DateFormat('yyyy/MM/dd').format(e.date)),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}

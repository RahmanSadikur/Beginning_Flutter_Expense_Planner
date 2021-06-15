import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transaction = [
    Transaction(id: 1, name: 'abc', amount: 20.00, date: DateTime.now()),
    Transaction(id: 2, name: 'efg', amount: 30.00, date: DateTime.now()),
    Transaction(id: 3, name: 'ijk', amount: 40.00, date: DateTime.now()),
  ];
  void _addNewTransaction(String txName, double txAmount) {
    final tx = Transaction(
        id: _transaction.length,
        name: txName,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _transaction.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        Transaction_list(_transaction),
      ],
    );
  }
}

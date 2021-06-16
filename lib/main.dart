import 'package:expenseplanner/widgets/chart.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';

import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatefulWidget {
  @override
  _ExpensePlannerState createState() => _ExpensePlannerState();
}

class _ExpensePlannerState extends State<ExpensePlanner> {
  final List<Transaction> _transaction = [
    // Transaction(id: 1, name: 'abc', amount: 20.00, date: DateTime.now()),
    // Transaction(id: 2, name: 'efg', amount: 30.00, date: DateTime.now()),
    // Transaction(id: 3, name: 'ijk', amount: 40.00, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransaction {
    final today = DateTime.now();
    return _transaction.where((tx) {
      return tx.date.isAfter(today.subtract(const Duration(days: 7)));
    }).toList();
  }

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

  void _startAddNewTrasaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.greenAccent,
            fontFamily: 'Ubuntu',
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                        title: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )))),
        title: 'Expense Planner',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Expense Planner',
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    _startAddNewTrasaction(context);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransaction),
                Transaction_list(_transaction),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTrasaction(context),
            ),
          ),
        ));
  }
}

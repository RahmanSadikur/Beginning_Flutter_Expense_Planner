import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction_list extends StatelessWidget {
  //const Transaction_list({Key? key}) : super(key: key);

  final List<Transaction> _transaction;
  Transaction_list(this._transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transaction.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${_transaction[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _transaction[index].name,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(DateFormat('yyyy/MM/dd')
                            .format(_transaction[index].date)),
                      ],
                    )
                  ],
                ));
              },
              itemCount: _transaction.length,
            ),
    );
  }
}

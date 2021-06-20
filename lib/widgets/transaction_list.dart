import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';

class Transaction_list extends StatelessWidget {
  //const Transaction_list({Key? key}) : super(key: key);
  final Function rmvTransaction;
  final List<Transaction> _transaction;
  Transaction_list(this._transaction, this.rmvTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: _transaction.isEmpty
          ? LayoutBuilder(builder: (context, Constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'No transaction added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: Constraints.maxHeight * .7,
                    child: Image.asset(
                      'assets/images/11.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${_transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _transaction[index].name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(_transaction[index].date)),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                            onPressed: () {
                              rmvTransaction(_transaction[index].id);
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              rmvTransaction(_transaction[index].id);
                            },
                          ),
                  ),
                );
              },
              itemCount: _transaction.length,
            ),
    );
  }
}

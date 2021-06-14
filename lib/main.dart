import 'package:flutter/material.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  @override
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Planner',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Expense Planner'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('Chart'),
                    elevation: 5,
                    color: Colors.amber,
                  ),
                ),
              ],
            )));
  }
}

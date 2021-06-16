import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> _recentTransaction;
  Chart(this._recentTransaction);
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      print(_recentTransaction);
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].date.day == weekday.day &&
            _recentTransaction[i].date.month == weekday.month &&
            _recentTransaction[i].date.year == weekday.year) {
          totalSum += _recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupTransactionValues.map((e) {}).toList(),
      ),
    );
  }
}

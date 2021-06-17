import 'package:expenseplanner/widgets/chart.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Home());
}

class Home extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.greenAccent,
          fontFamily: 'Ubuntu',
          errorColor: Colors.red,
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
                  ),
                  button: TextStyle(color: Colors.white),
                ),
          ),
        ),
        title: 'Expense Planner',
        home: ExpensePlanner());
  }
}

class ExpensePlanner extends StatefulWidget {
  @override
  _ExpensePlannerState createState() => _ExpensePlannerState();
}

class _ExpensePlannerState extends State<ExpensePlanner> {
  final List<Transaction> _transaction = [
    //Transaction(id: 1, name: 'abc', amount: 20.00, date: DateTime.now()),
    // Transaction(id: 2, name: 'efg', amount: 30.00, date: DateTime.now()),
    // Transaction(id: 3, name: 'ijk', amount: 40.00, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransaction {
    final today = DateTime.now();
    return _transaction.where((tx) {
      return tx.date.isAfter(today.subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txName, double txAmount, DateTime txDate) {
    final tx = Transaction(
      id: _transaction.length,
      name: txName,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _transaction.add(tx);
    });
  }

  void _removeTransaction(int id) {
    setState(() {
      _transaction.removeWhere((element) {
        return element.id == id;
      });
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
    final islandscap =
        MediaQuery.of(context).orientation == Orientation.landscape;
    bool shwChart = false;
    final appvar = AppBar(
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
    );
    return Scaffold(
      appBar: appvar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           if(islandscap) {
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Show bar'),
                      Switch(
                          value: shwChart,
                          onChanged: (v) {
                            setState(() {
                              shwChart = v;
                            });
                          })
                    ],
                  )
                  shwChart ?Container(
                    height: (MediaQuery.of(context).size.height -
                            appvar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        1,
                    child: Chart(_recentTransaction),
                  ): Container(
                height: (MediaQuery.of(context).size.height -
                        appvar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    1,
                child: Transaction_list(_transaction, _removeTransaction),)
            }else{ Container(
                    height: (MediaQuery.of(context).size.height -
                            appvar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                    child: Chart(_recentTransaction),
                  ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appvar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: Transaction_list(_transaction, _removeTransaction),),
            }
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
    );
  }
}

/*import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transactionlist.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  UserTransactionState createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction> {
  @override
  final List<Transaction> usertransaction = [
    //Transaction(id: 't1', title: 'shoes', amount: 34.43, date: DateTime.now()),
    //Transaction(
      //  id: 't2', title: 'clothes', amount: 69.99, date: DateTime.now()),
  ];

  void addNewtransaction(String txtitle, double txamount) {
    final newtx = Transaction(
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      usertransaction.add(newtx);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewtransaction),
        TransactionList(usertransaction,),
      ],
    );
  }
}

 */

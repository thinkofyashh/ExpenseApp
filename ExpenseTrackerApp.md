import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transactionlist.dart';
import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.yellow,
        textTheme: GoogleFonts.robotoFlexTextTheme(),
        appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.adventPro(
                fontWeight: FontWeight.bold, fontSize: 30)),
        // colorScheme: ColorScheme.light(
        //   primary: Colors.lightGreenAccent, secondary: Colors.purpleAccent),
      ),
      title: 'Expense App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String titleInput='';
  //String amountInput='';
  // final titleController=TextEditingController();
  //final amountController=TextEditingController();
  @override
  final List<Transaction> usertransaction = [
    // Transaction(id: 't1', title: 'shoes', amount: 34.43, date: DateTime.now()),
    //Transaction(
    //  id: 't2', title: 'clothes', amount: 69.99, date: DateTime.now()),
  ];

  List<Transaction> get recentTransaction {
    return usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewtransaction(String txtitle, double txamount,DateTime chosenDate) {
    final newtx = Transaction(
        title: txtitle,
        amount: txamount,
        date: chosenDate,
        id: DateTime.now().toString());
    setState(() {
      usertransaction.add(newtx);
    });
  }
  void deletetransaction(String iD){
    setState(() {
      usertransaction.removeWhere((tx){
        return tx.id==iD;
      } );
    });

  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addNewtransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXPENSE"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // Image.asset('assets/images/img.png'),
          children: <Widget>[
            Chart(recentTransaction),
            TransactionList(usertransaction,deletetransaction),
            // NewTransaction(),
            //TransactionList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
    );
  }
}

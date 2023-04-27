import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  @override
  final List<Transaction> transactions;
  final Function deletedtx;

  TransactionList(this.transactions,this.deletedtx);

  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "NO TRANSACTION ADDED.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 300,
                      child: Image.asset("assets/images/empty.jpg")),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child:
                                    Text("\$${transactions[index].amount}"))),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: GoogleFonts.adamina(),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {deletedtx(transactions[index].id);},
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
                //mainAxisAlignment: MainAxisAlignment.end,
              ));
  }
}

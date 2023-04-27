import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newtx;

  NewTransaction(this.newtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || selectedDate==null) {
      return;
    }
    widget.newtx(enteredtitle, enteredamount,selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickeDate) {
      if (pickeDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickeDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            //onChanged: (val){
            //titleInput=val;

            //},
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            //onChanged: (val)=>amountInput=val,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Row(
            children: [
              Expanded(
                child: Text(selectedDate != null
                    ?'Picked Date : ${DateFormat.yMMMd().format(selectedDate!)}':'No Choson date!!'),
              ),
              TextButton(
                onPressed: presentDatePicker,
                child: Text(
                  'Chosen date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: submitData
              //() {
              // print(titleInput);
              // newtx(titleController.text,double.parse(amountController.text));
              //print(amountInput);
              // print(titleController.text);
              //print(amountController.text);}
              ,
              child: Text(
                "ADD TRANSACTIONS",
                style: GoogleFonts.aladin(),
              ))
        ],
      ),
    );
  }
}

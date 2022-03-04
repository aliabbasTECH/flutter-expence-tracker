import 'dart:html';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitdata() {
    final enterdtitle = titleController.text;
    final enterdamount = double.parse(amountController.text);

    if (enterdtitle.isEmpty || enterdamount <= 0) {
      return;
    }

    widget.addTX(
      enterdtitle, 
      enterdamount);

      Navigator.pop(context); // THIS IS for closed popup screen that showse after clicking on add button
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitdata(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitdata(),
              ),
              TextButton(
                onPressed: submitdata,
                child: Text("Add Transaction"),
              )
            ]),
      ),
    );
  }
}

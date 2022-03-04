import 'package:flutter/material.dart';
import './Transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transcation> transactions = [
    Transcation(
      id: "t1",
      title: "bills",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transcation(
      id: "t1",
      title: "new shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transcation(
      id: "t1",
      title: "Groceries",
      amount: 69.99,
      date: DateTime.now(),
    )
  ];
  // | this is used to change values but not shows value in stateless widget , because stateless widegt is not change any value on User Interface untill it will re-render means restart using hot-restart 
  // v  TextEditingController() is flutter class that assign on text fields to work as onchange functionality that change values that will provided in text fild save values on submit the values . 
  
    final titleController = TextEditingController();     
    final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("Chart!"),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
//                      | the using TextEditingController class flutter automaticly connect to TextField  listen user input and save the user input 
//                      V bacause of this you dont need onchange function.  
                        controller: titleController,
                        // onChanged: (val)=> titleInput=val, 
                        ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        // onChanged: (val)=>amountInput=val,
                        ),
                      TextButton( 
//                      |  there is we used TextEditingController to show the values in terminal or console 
//                      V  
                        onPressed: (){
                          print(titleController.text);
                          print(amountController.text);
                        
                        },
                        child: Text("Add Transaction"),
                      )
                    ]
                    ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$ ${tx.amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tx.title,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}

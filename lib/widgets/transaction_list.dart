import '../models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TransactionList extends StatelessWidget {
        final List<Transcation> transactions;
         
         TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      
        child: ListView.builder(
          itemBuilder:(ctx,index){
                return Card(
                        child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor) ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor ),
                                
                          ),
                          
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${transactions[index].title}",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("${DateFormat.yMMMd().format(transactions[index].date)} | ${transactions[index].id}",
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        )
                      ],
                    )); 
          }, itemCount:transactions.length,
                  
                ),
      
    );
  }
}
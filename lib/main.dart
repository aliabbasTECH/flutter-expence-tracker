
import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpenceTracker',
      theme:   ThemeData(
        primarySwatch: Colors.deepOrange,
        
         
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  var theamscolors= [0xFF80DEEA,0xFF00E5FF,0xFFFF8A65,0xFF81C784,0xFF00E676,];
  final List<Transcation> _UserTranscations = [
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

  void _addNewTransaction(String TXtitle, double TXamount) {
    final newTx = Transcation(
      title: TXtitle,
      amount: TXamount,
      date: DateTime.now(),
      id: "t3",
    );
 
    setState(() {
      _UserTranscations.add(newTx);
      
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
            onTap: () {}, 
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
            );
      },
    );
  }
  
  
    var ind=0;
  void index(){
  var res = ind <= 4 ? ind+=1 :ind=0; 
    print(ind);
  } 
  
  

  @override
  Widget build(BuildContext context) {
  print(ind);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent,
        title: const Text('ExpenceTracker'),
        actions: [
          IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: Icon(Icons.add)),
          IconButton(
              onPressed:index,
              icon: Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Color(theamscolors[ind]) ,
                child: Text("Chart!"),
                elevation: 5,
              ),
            ),
            TransactionList(transactions: _UserTranscations),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

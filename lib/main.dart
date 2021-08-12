import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Coffee',
      amount: 5.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Dinner',
      amount: 12.99,
      date: DateTime.now(),
    )
  ];

  final titleController = TextEditingController();
  final amountContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To avoud button overflow by pixels problem
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Personal Expenses'),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Card(
              child: Text('Chart!'),
            ),
          ),
          // Transaction input field ==============================
          Card(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountContoller,
                ),
                FlatButton(
                  child: Text('Add'),
                  textColor: Colors.blue[900],
                  onPressed: () {
                    print(titleController.text);
                    print(amountContoller.text);
                  },
                ),
              ],
            ),
          ),
          // Transaction input field ==============================
          // Transaction cards ==============================
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: (Colors.blue[900]!),
                        width: 1.5,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${transaction.amount.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Transaction cards ==============================
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

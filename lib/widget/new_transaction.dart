import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function transactionHandler;

  NewTransaction(this.transactionHandler);

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              // onChanged: (val) => titleInput = val,
              // instead use controller
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              // instead use controller
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                transactionHandler(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

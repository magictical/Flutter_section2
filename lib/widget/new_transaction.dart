import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function transactionHandler;

  NewTransaction(this.transactionHandler);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // check valid input data
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    transactionHandler(
      titleController.text,
      double.parse(amountController.text),
    );
  }

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
              //(_) : convention for not to use even if flutter force to use it
              // anonymous fuction has to be executed! with ()
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              keyboardType: TextInputType.number,

              // onChanged: (val) => amountInput = val,
              // instead use controller
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}

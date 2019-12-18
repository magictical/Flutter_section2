import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function transactionHandler;

  NewTransaction(this.transactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // check valid input data
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // transactionHandler는 NewTransaction의 property로 State클래스에서
    // 사용할 수 없지만 flutter의 widget.~ 을 사용해서 접근할 수있다.
    widget.transactionHandler(
      enteredTitle,
      enteredAmount,
    );
    // close the window after user input
    Navigator.of(context).pop();
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

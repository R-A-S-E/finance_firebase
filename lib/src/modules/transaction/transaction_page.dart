import 'package:finance_firebase/src/modules/transaction/controller/transaction_controller.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  final TransactionModel? transaction;
  const TransactionPage({super.key, this.transaction});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final TransactionController controllerTrans = TransactionController();

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      controllerTrans.text = widget.transaction!.text;
      controllerTrans.category = widget.transaction!.category;
      controllerTrans.date = widget.transaction!.date;
      controllerTrans.isEntry = widget.transaction!.isEntry;
      controllerTrans.value = widget.transaction!.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controllerTrans.text = value,
              decoration: InputDecoration(
                  label: Text(widget.transaction?.text ?? 'text')),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => controllerTrans.value = double.parse(value),
              decoration: InputDecoration(
                  label: Text(widget.transaction?.value.toString() ?? 'Valor')),
            ),
            const SizedBox(height: 16),
            // TextField(
            //   onChanged: (value) => controllerTrans.text = value,
            //   decoration: const InputDecoration(label: Text('Text')),
            // ),
            // const SizedBox(height: 16),
            // TextField(
            //   onChanged: (value) => controllerTrans.text = value,
            //   decoration: const InputDecoration(label: Text('Text')),
            // ),
            // const SizedBox(height: 16),
            TextField(
              onChanged: (value) => controllerTrans.category = value,
              decoration: InputDecoration(
                  label: Text(widget.transaction?.category ?? 'Category')),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  if (widget.transaction != null) {
                    controllerTrans.updateTransaction(widget.transaction!
                        .copyWith(
                            date: controllerTrans.date,
                            category: controllerTrans.category,
                            isEntry: true,
                            text: controllerTrans.text,
                            value: controllerTrans.value));
                  } else {
                    controllerTrans.addTransaction();
                  }
                  Navigator.pop(context);
                },
                child: const Text('iii la vamos nós'))
          ],
        ),
      ),
    );
  }
}

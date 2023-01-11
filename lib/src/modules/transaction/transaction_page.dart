import 'package:finance_firebase/src/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  final HomeController controller = GetIt.I.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (value) =>
                controller.transaction!.copyWith(category: value),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {
                if (controller.transaction != null) {
                  print(controller.transaction.toString());
                }
              },
              child: Text('iii la vamos nós'))
        ],
      ),
    );
  }
}

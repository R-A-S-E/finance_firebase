import 'package:finance_firebase/src/modules/home/controller/home_controller.dart';
import 'package:finance_firebase/src/modules/transaction/transaction_page.dart';
import 'package:finance_firebase/src/shared/services/current_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = GetIt.I.get();

  @override
  void initState() {
    controller.initTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        if (controller.currentState == CurrentState.loading) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        } else if (controller.currentState == CurrentState.empty) {
          return const Expanded(
            child: Center(
              child: Text(
                'Você ainda não tem nenhuma transação',
              ),
            ),
          );
        } else if (controller.currentState == CurrentState.failed) {
          return const Expanded(
            child: Center(
              child: Text(
                'Desculpe ocorreu algum erro',
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: controller.listTransaction
                    .map(
                      (transaction) => ListTile(
                        title: Text(transaction.text),
                        leading: Text(transaction.value.toString()),
                        trailing: Text(transaction.category),
                        textColor:
                            transaction.isEntry ? Colors.green : Colors.red,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionPage(
                                      transaction: transaction,
                                    ))),
                      ),
                    )
                    .toList()),
          ));
        }
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TransactionPage()));
      }),
    );
  }
}

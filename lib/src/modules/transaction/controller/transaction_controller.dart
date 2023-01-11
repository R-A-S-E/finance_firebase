import 'package:finance_firebase/src/modules/home/controller/home_controller.dart';
import 'package:finance_firebase/src/modules/transaction/repository/transaction_repository.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';
import 'package:get_it/get_it.dart';

class TransactionController {
  final HomeController controller = GetIt.I.get();
  final TransactionRepository transactionRepository = TransactionRepository();
  String text = '';
  double value = 0;
  bool isEntry = false;
  DateTime date = DateTime.now();
  String category = '';

  addTransaction() async {
    final transaction = TransactionModel(
        text: text,
        value: value,
        isEntry: isEntry,
        date: date,
        category: category);
    var data = await transactionRepository.addTransaction(transaction);
    controller.setTransaction(value: data);
  }

  updateTransaction(TransactionModel transaction) async {
    await transactionRepository.updateTransaction(transaction);
    controller.listTransaction
        .removeWhere((element) => element.id == transaction.id);
    controller.setTransaction(value: transaction);
  }
}

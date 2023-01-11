import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';

class TransactionRepository {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<TransactionModel> addTransaction(TransactionModel transaction) async {
    var item =
        await firebase.collection('transaction').add(transaction.toMap());

    return transaction.copyWith(id: item.id);
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await firebase
        .collection('transaction')
        .doc(transaction.id)
        .update(transaction.toMap());
  }
}

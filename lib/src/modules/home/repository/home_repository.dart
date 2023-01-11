import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';

class HomeRepository {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<List<TransactionModel>> getTransaction() async {
    final snapshot = await firebase.collection('transaction').get();

    final List<TransactionModel> listTransactions = [];

    for (var doc in snapshot.docs) {
      TransactionModel item = TransactionModel.fromFirestore(doc);
      item.id = doc.id;
      listTransactions.add(item);
    }

    return listTransactions;
  }
}

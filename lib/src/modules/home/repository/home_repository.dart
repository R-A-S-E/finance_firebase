import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';

class HomeRepository {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<List<TransactionModel>> getTransaction() async {
    final snapshot = await firebase.collection('transaction').get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}

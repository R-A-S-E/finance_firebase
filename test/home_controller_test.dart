import 'package:finance_firebase/src/modules/home/controller/home_controller.dart';
import 'package:finance_firebase/src/modules/home/repository/home_repository.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() async {
  test('test init transaction', () async {
    final repository = MockHomeRepository();
    final controller = HomeController(repository);
    final list = [
      TransactionModel(
          text: 'text',
          value: 22,
          isEntry: false,
          date: DateTime.now(),
          category: 'category')
    ];

    when(
      () => repository.getTransaction(),
    ).thenAnswer((invocation) async => list);

    await controller.initTransaction();

    expect(controller.listTransaction, list);
  });

  test('test set transaction', () async {
    final repository = MockHomeRepository();
    final controller = HomeController(repository);
    final model = TransactionModel(
        text: 'text',
        value: 22,
        isEntry: false,
        date: DateTime.now(),
        category: 'category');
    final list = [
      TransactionModel(
          text: 'text',
          value: 22,
          isEntry: false,
          date: DateTime.now(),
          category: 'category')
    ];
    controller.setTransaction(value: model);

    expect(controller.listTransaction, list);
  });
}

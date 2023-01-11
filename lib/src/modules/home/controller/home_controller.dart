import 'package:finance_firebase/src/modules/home/repository/home_repository.dart';
import 'package:finance_firebase/src/shared/models/transaction_model.dart';
import 'package:finance_firebase/src/shared/services/current_state.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HomeRepository repository;

  HomeControllerBase(this.repository);

  @observable
  ObservableList<TransactionModel> listTransaction =
      ObservableList<TransactionModel>();

  @action
  void setTransactions({required List<TransactionModel> values}) {
    listTransaction.clear();
    listTransaction.addAll(values);
  }

  @action
  void setTransaction({required TransactionModel value}) {
    listTransaction.add(value);
  }

  @observable
  CurrentState currentState = CurrentState.empty;

  @action
  void setState({required CurrentState value}) => currentState = value;

  Future<void> initTransaction() async {
    setState(value: CurrentState.loading);
    final transaction = await repository.getTransaction();
    setTransactions(values: transaction);
    setState(value: CurrentState.success);
  }
}

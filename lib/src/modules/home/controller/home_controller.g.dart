// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listTransactionAtom =
      Atom(name: 'HomeControllerBase.listTransaction', context: context);

  @override
  ObservableList<TransactionModel> get listTransaction {
    _$listTransactionAtom.reportRead();
    return super.listTransaction;
  }

  @override
  set listTransaction(ObservableList<TransactionModel> value) {
    _$listTransactionAtom.reportWrite(value, super.listTransaction, () {
      super.listTransaction = value;
    });
  }

  late final _$currentStateAtom =
      Atom(name: 'HomeControllerBase.currentState', context: context);

  @override
  CurrentState get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(CurrentState value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setTransactions({required List<TransactionModel> values}) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setTransactions');
    try {
      return super.setTransactions(values: values);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTransaction({required TransactionModel value}) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setTransaction');
    try {
      return super.setTransaction(value: value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState({required CurrentState value}) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setState');
    try {
      return super.setState(value: value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTransaction: ${listTransaction},
currentState: ${currentState}
    ''';
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  String? id;
  String text;
  double value;
  bool isEntry;
  DateTime date;
  String category;
  TransactionModel({
    this.id,
    required this.text,
    required this.value,
    required this.isEntry,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
      'isEntry': isEntry,
      'date': date.millisecondsSinceEpoch,
      'category': category,
    };
  }

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return TransactionModel(
      text: map['text'] as String,
      value: map['value'] as double,
      isEntry: map['isEntry'] as bool,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      category: map['category'] as String,
    );
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      text: map['text'] as String,
      value: map['value'] as double,
      isEntry: map['isEntry'] as bool,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TransactionModel copyWith({
    String? id,
    String? text,
    double? value,
    bool? isEntry,
    DateTime? date,
    String? category,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      text: text ?? this.text,
      value: value ?? this.value,
      isEntry: isEntry ?? this.isEntry,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, text: $text, value: $value, isEntry: $isEntry, date: $date, category: $category)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.value == value &&
        other.isEntry == isEntry &&
        other.date == date &&
        other.category == category;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        value.hashCode ^
        isEntry.hashCode ^
        date.hashCode ^
        category.hashCode;
  }
}

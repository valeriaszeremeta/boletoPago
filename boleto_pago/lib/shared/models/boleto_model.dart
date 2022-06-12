import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';



class BoletoModel {
  final String? boletoId;
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  final String? observacao;
  BoletoModel({
    this.boletoId,
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.observacao,
  });

  BoletoModel copyWith({
    String? boletoId,
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
    String? observacao,
  }) {
    return BoletoModel(
      boletoId: boletoId ?? this.boletoId,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      observacao: observacao ?? this.observacao,
    );
  }

  static BoletoModel fromJson(Map<String, dynamic> json) => BoletoModel(
    boletoId: json['boletoId'],
    name: json['name'],
    dueDate: (json['dueDate'] ).toString(),
    value: json['value']?.toDouble(),
    barcode: json['barcode'],
    observacao: json['observacao'],
  );

  Map<String, dynamic> toMap() {
    return {
      'boletoId': boletoId,
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'observacao': observacao,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      boletoId: map['boletoId'],
      name: map['name'],
      dueDate: map['dueDate'].toString(),
      value: map['value']?.toDouble(),
      barcode: map['barcode'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  //factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(boletoId: $boletoId, name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, observacao: $observacao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.boletoId == boletoId &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.barcode == barcode &&
      other.observacao == observacao;
  }

  @override
  int get hashCode {
    return boletoId.hashCode ^
      name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      barcode.hashCode ^
      observacao.hashCode;
  }
}

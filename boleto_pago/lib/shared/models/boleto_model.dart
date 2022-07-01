import 'dart:convert';

class BoletoModel {
  final String? userid;
  final String? boletoId;
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  final String? observacao;
  BoletoModel({
    this.userid,
    this.boletoId,
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.observacao,
  });
  

  BoletoModel copyWith({
    String? userid,
    String? boletoId,
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
    String? observacao,
  }) {
    return BoletoModel(
      userid: userid ?? this.userid,
      boletoId: boletoId ?? this.boletoId,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      observacao: observacao ?? this.observacao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
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
      userid: map['userid'],
      boletoId: map['boletoId'],
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value']?.toDouble(),
      barcode: map['barcode'],
      observacao: map['observacao'],
    );
  }

   static BoletoModel fromJson(Map<String, dynamic> json) => BoletoModel(
        boletoId: json['boletoId'],
        name: json['name'],
        dueDate: (json['dueDate']).toString(),
        value: json['value']?.toDouble(),
        barcode: json['barcode'],
        observacao: json['observacao'],
      );


  String toJson() => json.encode(toMap());

 // factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(userid: $userid, boletoId: $boletoId, name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, observacao: $observacao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.userid == userid &&
      other.boletoId == boletoId &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.barcode == barcode &&
      other.observacao == observacao;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
      boletoId.hashCode ^
      name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      barcode.hashCode ^
      observacao.hashCode;
  }
}

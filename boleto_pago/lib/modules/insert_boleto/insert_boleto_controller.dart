import 'package:boleto_pago/shared/models/boleto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var uid = '';

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange(
      {String? boletoId,
      String? name,
      String? dueDate,
      double? value,
      String? barcode,
      String? observacao}) {
    model = model.copyWith(
        boletoId: boletoId,
        name: name,
        dueDate: dueDate,
        value: value,
        barcode: barcode,
        observacao: observacao);
  }

  Future<void> saveBoleto() async {
    this.uid = this._auth.currentUser!.uid;
    firestore.collection("boletos").add({
      "boletoId": this.uid,
      "name": model.name,
      "dueDate": model.dueDate,
      "value": model.value,
      "barcode": model.barcode,
      "observacao": model.observacao
    });
  }

  bool cadastrarBoleto() {
    final form = formKey.currentState;
    if (form!.validate()) {
      saveBoleto();
      return true;
    }
    return false;
  }
}

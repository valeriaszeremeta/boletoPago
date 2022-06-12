import 'package:boleto_pago/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecuperarSenhaController {
  final formKey = GlobalKey<FormState>();
  UserModel usuario = UserModel(nome: '', email: '', senha: '', );
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? validateSenha(String? value) =>
      value?.isEmpty ?? true ? "O campo Senha precisa ser preenchido" : null;

  void onChange({
    String? senha,
  }) {
    usuario = usuario.copyWith(senha: senha);
  }

  recuperarSenha() {
    print('clique');
  }
}

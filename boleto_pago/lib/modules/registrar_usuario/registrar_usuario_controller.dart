import 'package:boleto_pago/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class RegistrarUsuarioController {
  final formKey = GlobalKey<FormState>();
  UserModel usuario = UserModel(nome: '', email: '', senha: '');
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? validateName(String? value) => value?.isEmpty ?? true
      ? "O campo Nome Completo não pode ser vazio"
      : null;
  String? validateSenha(String? value) =>
      value?.isEmpty ?? true ? "O campo Senha precisa ser preenchido" : null;
  String? validateEmail(String? value) =>
      value?.isEmpty ?? true ? "O campo Email precisa ser preenchido" : null;

  void onChange({
    String? nome,
    String? senha,
    String? email,
  }) {
    usuario = usuario.copyWith(nome: nome, senha: senha, email: email);
  }

  Future<void> saveUser() async {
    firestore.collection("usuarios").add({
      "nome": usuario.nome,
      "senha": usuario.senha,
      "email": usuario.email,
    });
  }

  createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usuario.email, password: usuario.senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthException('O email já está sendo usado');
      }
    }
  }

  bool cadastrarUsuario() {
    final form = formKey.currentState;
    if (form!.validate()) {
      saveUser();
      createUser();
      return true;
    }
    return false;
  }
}

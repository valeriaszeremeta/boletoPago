
import 'package:boleto_pago/shared/auth/auth_controller.dart';
import 'package:boleto_pago/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class LoginController {
  final authController = AuthController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel model = UserModel(nome: '', email: '', senha: '');
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final uid = '';

  UserModel? _user;

  UserModel get user => _user!;

  void onChange({
    String? nome,
    String? email,
    String? senha,
  }) {
    model = model.copyWith(
      nome: nome,
      email: email,
      senha: senha,
    );
  }

  String? validateSenha(String? value) =>
      value?.isEmpty ?? true ? "O campo Senha precisa ser preenchido" : null;
  String? validateEmail(String? value) =>
      value?.isEmpty ?? true ? "O campo Email precisa ser preenchido" : null;

  signIn() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: model.email, password: model.senha);
      final user = UserModel(
        nome: '',
        photoURL: '',
        email: '',
        senha: '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Nenhum usuário encontrado para esse e-mail.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta fornecida para esse usuário.');
      }
    }
  }
  bool login() {
    final form = formKey.currentState;
    if (form!.validate()) {
      signIn();
      return true;
    }
    return false;
  }

  Future<String?> signInwithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final user = UserModel(
        nome: googleSignInAccount!.displayName!,
        photoURL: '',
        email: googleSignInAccount.email,
        senha: '',
      );
      authController.setUser(context, user);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      authController.setUser(context, null);
      print(e.message);
      throw e;
    }
  }
}

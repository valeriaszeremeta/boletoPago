import 'dart:convert';

class UserModel {
  final String nome;
  final String senha;
  final String email;
  final String? photoURL;
  UserModel({
    required this.nome,
    required this.senha,
    required this.email,
    this.photoURL,
  });

  UserModel copyWith({
    String? nome,
    String? senha,
    String? email,
    String? photoURL,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      senha: senha ?? this.senha,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'senha': senha,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'] ?? '',
      senha: map['senha'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(nome: $nome, senha: $senha, email: $email, photoURL: $photoURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.nome == nome &&
      other.senha == senha &&
      other.email == email &&
      other.photoURL == photoURL;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
      senha.hashCode ^
      email.hashCode ^
      photoURL.hashCode;
  }
}

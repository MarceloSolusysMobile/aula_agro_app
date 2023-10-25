import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  String id;
  String nome;
  String descricao;
  String avatar;
  double valor;

  Produto(
      {this.id = '',
      this.nome = '',
      this.descricao = '',
      this.avatar = '',
      this.valor = 0});

  factory Produto.fromDoc(DocumentSnapshot<Object?> data) {
    return Produto(
      nome: data['nome'],
      descricao: data['descricao'],
      avatar: data['avatar'],
      valor: data['valor']
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/produto.dart';

class ListagePrecos extends StatefulWidget {
  const ListagePrecos({super.key});

  @override
  State<ListagePrecos> createState() => _ListagePrecosState();
}

class _ListagePrecosState extends State<ListagePrecos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: const Text("Cotação do Dia")),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('produtos').snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index){
                Produto produto = Produto.fromDoc(documents[index]);
                return ListTile(
                  leading: Image.network(produto.avatar),
                  trailing: Text('R\$ ${produto.valor.toString()}'),
                  title: Text(produto.nome),
                  subtitle: Text(produto.descricao),
                );
              },
            );
          }

        )
        
      );
  }
}
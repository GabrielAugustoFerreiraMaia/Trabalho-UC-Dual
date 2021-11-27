import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Usuario {
  Usuario.fromDocument(
      DocumentSnapshot document, this.id, this.email, this.pass) {
    id = document.id;

    email = document['email'] as String;
    pass = document['pass'] as String;
  }

  Usuario({required this.email, required this.pass, this.name,  this.id});

  String? name;
  String? id;
  String email;
  String pass;

  String? confirmPassword;

  bool admin = false;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set({'name': name, 'email': email});
  }
}

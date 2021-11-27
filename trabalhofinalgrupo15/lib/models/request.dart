import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Request {
  Request.fromDocument(DocumentSnapshot document, this.request,
      this.localization, this.cliente, this.step) {
    id = document.id;
    cliente = document['cliente'] as String;
    request = document['request'] as String;
    step = document['step'] as int;
    localization = document['localization'] as String;
  }

  Request(this.request, this.localization, this.cliente, this.step);

  String? id;
  String cliente;
  String request;
  int step;
  String localization;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('request/$id');

  Future<void> saveData() async {
    await FirebaseFirestore.instance.collection('request').doc(id).set({
      'cliente': cliente,
      'request': request,
      'step': step,
      'localization': localization
    });
  }
}

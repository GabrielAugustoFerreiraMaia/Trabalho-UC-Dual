import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalhofinalgrupo15/helpers/firebase_errors.dart';
import 'package:trabalhofinalgrupo15/models/request.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';

class RequestManager extends ChangeNotifier {
  RequestManager() {
    loadAllRequest();
  }

  List<Request> allRequest = [];

  Future<void> loadAllRequest() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshotRequest =
        await firestore.collection('request').get();
    
    allRequest = snapshotRequest.docs
        .map((d) => Request.fromDocument(d, '', '', '', 0))
        .toList();

    notifyListeners();
  }

  Future<void> saveRequest(Request request, int step, String localization,
      String usuario, Function onFail, Function onSuccess) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await request.saveData();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}

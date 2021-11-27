import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:trabalhofinalgrupo15/helpers/firebase_errors.dart';
import 'package:trabalhofinalgrupo15/models/request.dart';
import 'package:trabalhofinalgrupo15/models/usuario.dart';

class UserManager extends ChangeNotifier {
  UserManager() {

  }

  bool _loading = false;
  bool get loading => _loading;

  fire.User? user;
  Usuario? usuario;
  bool admin=false;

  bool get isLoggedIn => user != null;

  //funcao de logar
  Future<void> signIn(
      {required Usuario usuario,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final fire.FirebaseAuth auth = fire.FirebaseAuth.instance;

      final fire.UserCredential result = await auth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.pass);
      this.user = result.user;
      onSuccess();
    } on fire.FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  //Função de cadastre se
  Future<void> signUp(
      {required Usuario usuario,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final fire.FirebaseAuth auth = fire.FirebaseAuth.instance;
    try {
      final fire.UserCredential result =
          await auth.createUserWithEmailAndPassword(
              email: usuario.email, password: usuario.pass);

      usuario.id = result.user!.uid;

      await usuario.saveData();

      onSuccess();
    } on fire.FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signOut() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final fire.FirebaseAuth auth = fire.FirebaseAuth.instance;
    auth.signOut();
    user = null;
    notifyListeners();
    
  }

  Future<void> _loadCurrentUser({fire.User? firebaseUser}) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final fire.FirebaseAuth auth = fire.FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    fire.User? currentUser = await firebaseUser ?? auth.currentUser;

    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      //Pegando dados do usuario e convertendo para "JSON"
      usuario = Usuario.fromDocument(
        docUser,
        '',
        '',
        '',
      );
      final docAdmin =
      await firestore.collection('admins').doc(usuario?.id).get();
      if (docAdmin.exists) {
        admin = docAdmin.exists;//Possivel solução que vou usar
        usuario?.admin = true;//Solução da video aula que dá o erro citado acima
      }
      print(admin);
      print(usuario?.admin);
      print(usuario?.id);
      notifyListeners();
    }

  }

  bool get adminEnabled => user != null && usuario!.admin;
}

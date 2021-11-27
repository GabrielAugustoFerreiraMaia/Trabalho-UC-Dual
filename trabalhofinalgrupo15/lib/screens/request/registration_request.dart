import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/helpers/firebase_errors.dart';
import 'package:trabalhofinalgrupo15/helpers/validators.dart';
import 'package:trabalhofinalgrupo15/models/request.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trabalhofinalgrupo15/models/request_manager.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/models/usuario.dart';
import 'package:trabalhofinalgrupo15/screens/request/request_screen.dart';

class RegistrationRequest extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Request request = Request('', '', '', 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        title: const Text('Realizar Solicitação'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<UserManager>(builder: (_, userManager, __) {
            return Form(
                key: formKey,
                child: Consumer<RequestManager>(
                  builder: (_, requestManager, __) {
                    return ListView(
                      padding: const EdgeInsets.all(17),
                      shrinkWrap: true,
                      children: <Widget>[
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 210, 174, 109),
                          textInputAction: TextInputAction.next,
                          validator: (relato) {
                            if (relato!.isEmpty)
                              return 'Campo Obrigatório';
                            else if (relato.trim().split(' ').length <= 1)
                              return 'Preencha o relato completo';
                            return null;
                          },
                          onSaved: (relato) => request.request = relato!,
                          decoration: const InputDecoration(
                              hintText: 'Digite o seu relato'),
                        ),
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 210, 174, 109),
                          textInputAction: TextInputAction.done,
                          validator: (endereco) {
                            if (endereco!.isEmpty)
                              return 'Campo Obrigatório';
                            else if (endereco.trim().split(' ').length <= 1)
                              return 'Preencha o endereço completo';
                            return null;
                          },
                          onSaved: (endereco) =>
                              request.localization = endereco!,
                          decoration: const InputDecoration(
                              hintText: 'Digite o endereço do incidente'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  requestManager.saveRequest(
                                    request,
                                    0,
                                    'localization',
                                    '${userManager.user?.email}',
                                    onFail,
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                  requestManager.loadAllRequest();
                                }
                                print('${userManager.user?.email}');
                                print('deu certo');
                              },
                              child: Text('Solicitar')),
                        )
                      ],
                    );
                  },
                ));
          }),
        ),
      ),
    );
  }
}

void onFail(FirebaseAuthException e) {
  getErrorString(e.code);
}

void onSuccess(context) {
  Navigator.of(context).pop();
  //RequestScreen();
}

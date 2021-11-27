import 'package:flutter/material.dart';
import 'package:trabalhofinalgrupo15/helpers/validators.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/models/usuario.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Usuario usuario = Usuario(email: '', pass: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        title: const Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formKey,
              child: Consumer<UserManager>(builder: (_, userManager, __) {
                return ListView(
                  padding: const EdgeInsets.all(17),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      cursorColor: const Color.fromARGB(255, 210, 174, 109),
                      enabled: !userManager.loading,
                      decoration:
                          const InputDecoration(hintText: 'Nome Completo'),
                      validator: (name) {
                        if (name!.isEmpty)
                          return 'Campo Obrigatório';
                        else if (name.trim().split(' ').length <= 1)
                          return 'Preencha seu nome completo';
                        return null;
                      },
                      onSaved: (name) => usuario.name = name!,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      cursorColor: const Color.fromARGB(255, 210, 174, 109),
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty)
                          return 'Campo Obrigatório';
                        else if (!emailValid(email)) return 'Email inválido!';
                        return null;
                      },
                      onSaved: (email) => usuario.email = email!,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      cursorColor: const Color.fromARGB(255, 210, 174, 109),
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      validator: (pass) {
                        if (pass!.isEmpty)
                          return 'Senha inválida';
                        else if (pass.length < 6) return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => usuario.pass = pass!,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: const Color.fromARGB(255, 210, 174, 109),
                      enabled: !userManager.loading,
                      decoration:
                          const InputDecoration(hintText: 'Repita a Senha'),
                      obscureText: true,
                      validator: (pass) {
                        if (pass!.isEmpty)
                          return 'Senha inválida';
                        else if (pass.length < 6) return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => usuario.confirmPassword = pass!,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    if (usuario.pass !=
                                        usuario.confirmPassword) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Senhas não coincidem!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                      return;
                                    }
                                    userManager.signUp(
                                        usuario: usuario,
                                        onFail: (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              'Falha ao cadastrar: $e',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          Navigator.of(context).pop();
                                        });
                                  }
                                },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Cadastrar')),
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  Field(
      {required this.text,
      required this.inputType,
      required this.fieldController,
      required this.hideInput});

  final String text;
  final TextInputType inputType;
  final TextEditingController fieldController;
  final bool hideInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideInput,
      controller: fieldController,
      decoration: InputDecoration(
        hintText: this.text,
      ),
      keyboardType: this.inputType,
    );
  }
}

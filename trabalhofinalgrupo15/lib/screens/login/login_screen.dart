import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:trabalhofinalgrupo15/helpers/validators.dart';
import 'package:trabalhofinalgrupo15/models/page_manager.dart';
import 'package:trabalhofinalgrupo15/models/usuario.dart' as us;
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/screens/base/base_screen.dart';
import 'package:trabalhofinalgrupo15/screens/sign_up/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        title: const Text('Login'),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Image.network(
                'https://cdn.discordapp.com/attachments/904048189122936832/906613568638697493/logo.png',
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                  key: formKey,
                  child: Consumer<UserManager>(
                    builder: (_, userManager, child) {
                      return ListView(
                        padding: const EdgeInsets.all(17),
                        shrinkWrap: true,
                        children: <Widget>[
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor:
                                const Color.fromARGB(255, 210, 174, 109),
                            controller: emailController,
                            enabled: !userManager.loading,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              hintText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            validator: (email) {
                              if (!emailValid(email!)) return 'E-mail inválido';
                              return null;
                            },
                          ),
                          TextFormField(
                              textInputAction: TextInputAction.done,
                              cursorColor:
                                  const Color.fromARGB(255, 210, 174, 109),
                              controller: passController,
                              enabled: !userManager.loading,
                              decoration:
                                  const InputDecoration(hintText: 'Senha'),
                              obscureText: true,
                              autocorrect: false,
                              validator: (pass) {
                                if (pass!.isEmpty || pass.length < 6)
                                  return 'Senha inválida';
                                return null;
                              }),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 210, 174, 109),
                                  ),
                                ),
                                style: ButtonStyle(
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              SizedBox(
                                width: 79,
                              ),

                              /*
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Esqueci minha Senha!',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 210, 174, 109),
                                  ),
                                ),
                                style: ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              */
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                                onPressed: userManager.loading
                                    ? null
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          userManager.signIn(
                                              usuario: us.Usuario(
                                                  email: emailController.text,
                                                  pass: passController.text),
                                              onFail: (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    'Falha ao entrar: $e',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  backgroundColor: Colors.red,
                                                ));
                                              },
                                              onSuccess: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => BaseScreen(),
                                                  ),
                                                );
                                              });
                                        }
                                      },
                                child: userManager.loading
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Text('Entrar')),
                          )
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

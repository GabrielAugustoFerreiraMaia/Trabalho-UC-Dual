import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Prime Automotive',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Olá, ${userManager.user?.email ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  if (userManager.isLoggedIn) {
                    userManager.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),(Route<dynamic> route) => false,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  userManager.isLoggedIn ? 'Sair' : 'Entre ou cadastre-se >',
                  style: TextStyle(
                      color: Color.fromARGB(255, 210, 174, 109),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

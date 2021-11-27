import 'package:flutter/material.dart';
import 'package:trabalhofinalgrupo15/common/drawer/custom_drawer.dart';

import 'package:trabalhofinalgrupo15/models/page_manager.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/screens/info/info_screen.dart';
import 'package:trabalhofinalgrupo15/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/screens/request/request_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 210, 174, 109),
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://api.whatsapp.com/send?phone=5531984703470');
                      },
                      child: Image.network(
                          'https://redeprimeautomotive.com.br/wp-content/uploads/2021/07/banner05.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 210, 174, 109),
                title: const Text('Informações'),
              ),
              body:  InfoScreen(),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 210, 174, 109),
                title: const Text('Minhas Solicitações'),
              ),
              body: RequestScreen(),
            )
          ],
        );
      }),
    );
  }
}

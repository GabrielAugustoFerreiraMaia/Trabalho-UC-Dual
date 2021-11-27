import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/common/drawer/custom_drawer_header.dart';
import 'package:trabalhofinalgrupo15/common/drawer/drawer_tile.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomDrawerHeader(),
          DrawerTile(
            iconData: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTile(
            iconData: Icons.info,
            title: 'Informações',
            page: 1,
          ),
          DrawerTile(
            iconData: Icons.playlist_add_check,
            title: 'Minhas solicitações',
            page: 2,
          ),
          /*
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled) {
                return Column(
                  children: <Widget>[
                    Divider(),
                    DrawerTile(
                      iconData: Icons.playlist_add_check,
                      title: 'Solicitações',
                      page: 3,
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          )*/
        ],
      ),
    );
  }
}

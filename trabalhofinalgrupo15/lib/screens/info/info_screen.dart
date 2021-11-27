import 'package:flutter/material.dart';
import 'package:trabalhofinalgrupo15/common/drawer/custom_drawer.dart';
import 'package:trabalhofinalgrupo15/screens/info/info_faq.dart';

import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  launch('https://delegaciavirtual.sids.mg.gov.br/sxgn/');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 70,
                    width: 350,
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Registre um Boletim de Ocorrência.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ),
          Center(
            child: InkWell(
                onTap: () {
                  launch('tel://190');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 70,
                    width: 350,
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Ligue para a polícia',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ),
          Center(
            child: InkWell(
                onTap: () {
                  launch(
                      'https://www.google.com.br/maps/place/Rede+Prime+Automotive/@-19.9156439,-43.956027,17z/data=!3m1!4b1!4m5!3m4!1s0xa6971aaf057a33:0x9f12259f2703c0a6!8m2!3d-19.915603!4d-43.953912?hl=pt-PT&authuser=0%27');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 70,
                    width: 350,
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Nossa central',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoFaq(),
            ),
          );
        },
        child: Icon(
          Icons.help_outline,
          size: 50,
        ),
      ),
    );
  }
}

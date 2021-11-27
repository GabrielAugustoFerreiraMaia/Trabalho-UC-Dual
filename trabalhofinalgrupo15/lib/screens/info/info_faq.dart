import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class InfoFaq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        title: const Text('FAQ'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GFAccordion(
              collapsedTitleBackgroundColor: Colors.grey,
              expandedTitleBackgroundColor: Colors.red,
              title: 'GF Accordion',
              content:
                  'GetWidget is an open source library that comes with pre-build 1000+ UI components.',
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize))
        ],
      ),
    );
  }
}

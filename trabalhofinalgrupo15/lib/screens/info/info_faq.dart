import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:accordion/accordion.dart';

class InfoFaq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        title: const Text('FAQ'),
        centerTitle: true,
      ),
      body: Accordion(
        maxOpenSections: 3,
        headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          AccordionSection(
            isOpen: true,
            leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
            header: Text('Introduction'),
            content: Text(
              '_loremIpsum',
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.compare_rounded, color: Colors.white),
            header: Text(
              'About Us',
            ),
            contentBorderColor: Color(0xffffffff),
            content: Row(
              children: [
                Icon(Icons.compare_rounded,
                    size: 120, color: Colors.orangeAccent),
                Flexible(
                    flex: 1,
                    child: Text(
                      '_loremIpsum',
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

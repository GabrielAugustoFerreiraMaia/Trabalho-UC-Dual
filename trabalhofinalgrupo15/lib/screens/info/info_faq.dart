import 'package:flutter/material.dart';

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
        maxOpenSections: 1,
        headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
            contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
            isOpen: false,
            leftIcon: Icon(Icons.help_outline, color: Colors.black),
            header: Text(
              'Como Solicitar um Guincho?',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              '1 - Entre em contato com a Rede Prime Automotive\n2 - Informe o ocorrido para o solicitação do guincho ',
              style: TextStyle(color: Colors.black),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 0,
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
            contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
            isOpen: false,
            leftIcon: Icon(Icons.help_outline, color: Colors.black),
            header: Text(
              'Qual oficina eu devo encaminhar?',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              '1 - Verfique na tela de informações a oficina mais próxima a você',
              style: TextStyle(color: Colors.black),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 0,
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
            contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
            isOpen: false,
            leftIcon: Icon(Icons.help_outline, color: Colors.black),
            header: Text(
              'Quais ações devo fazer?',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              '1 - Verfique a integridade e sáude dos envolvidos se necessário encaminha - los para um serviço de saúde\n2 - Registrar um boletim de ocorrência(link no aplicativo)\n 3 - Retirar seu veículo da via, se necessário solicitar um guincho',
              style: TextStyle(color: Colors.black),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 0,
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
            contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
            isOpen: false,
            leftIcon: Icon(Icons.help_outline, color: Colors.black),
            header: Text(
              'Como acompanhar os serviços a serem feito no carro?',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              '1 - Verifique na tela de solicitações sobre o andamento de suas solicitações, pode conferir também através dos nossos canais de comunicação',
              style: TextStyle(color: Colors.black),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 0,
          ),
          AccordionSection(
              headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
              contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
              isOpen: false,
              leftIcon: Icon(Icons.help_outline, color: Colors.black),
              header: Text(
                'Como solicitar um transporte extra?',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                '1 - Entre em contato com a RedePrime,\npara conseguir um veiculo extra caso você nescessite de um em casos de urgência\n( Ex: Pt no carro ou socorro )',
                style: TextStyle(color: Colors.black),
              ),
              contentHorizontalPadding: 20,
              contentBorderWidth: 0),
          AccordionSection(
              headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
              contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
              isOpen: false,
              leftIcon: Icon(Icons.help_outline, color: Colors.black),
              header: Text(
                'O que fazer com terceiros?',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                '1 - Fale com o causador do acidente para entrar em contato com a nossa rede de seguro, para poder negocioar o custo do prejuiso causado',
                style: TextStyle(color: Colors.black),
              ),
              contentHorizontalPadding: 20,
              contentBorderWidth: 0),
          AccordionSection(
              headerBackgroundColor: const Color.fromARGB(255, 210, 174, 109),
              contentBackgroundColor: const Color.fromARGB(200, 210, 174, 109),
              isOpen: false,
              leftIcon: Icon(Icons.help_outline, color: Colors.black),
              header: Text(
                'Qual é minha franquia?',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                '1 - Você pode verificar no seu contrato de adesão, perguntar nos nossos canais de atendimento',
                style: TextStyle(color: Colors.black),
              ),
              contentHorizontalPadding: 20,
              contentBorderWidth: 0),
        ],
      ),
    );
  }
}

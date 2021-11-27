import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/models/request.dart';
import 'package:trabalhofinalgrupo15/models/request_manager.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/screens/request/components/request_list_tile.dart';
import 'package:trabalhofinalgrupo15/screens/request/registration_request.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RequestManager>(builder: (_, requestManager, __) {
        return ListView.builder(
            padding: EdgeInsets.all(4),
            itemCount: requestManager.allRequest.length,
            itemBuilder: (_, index) {
              return RequestListTile(requestManager.allRequest[index]);
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 210, 174, 109),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationRequest(),
            ),
          );
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}

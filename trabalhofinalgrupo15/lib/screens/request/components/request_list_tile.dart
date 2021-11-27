import 'package:flutter/material.dart';
import 'package:trabalhofinalgrupo15/models/request.dart';

class RequestListTile extends StatelessWidget {
  RequestListTile(this.request);

  final Request request;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Relato: ${request.request}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Endereço ${request.localization}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCircle('1', 'Preparação', 1, 0),
                    Container(
                      height: 1,
                      width: 40,
                      color: Colors.grey,
                    ),
                    _buildCircle('2', 'No conserto', 2, 2),
                    Container(
                      height: 1,
                      width: 40,
                      color: Colors.grey,
                    ),
                    _buildCircle('3', 'Finalizado', 2, 3),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(String titulo, String subtitulo, int step, int thisStep) {
    Color backColor;
    Widget child;

    if (step < thisStep) {
      backColor = Colors.grey;
      child = Text(
        titulo,
        style: TextStyle(color: Colors.white),
      );
    } else if (step == thisStep) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: [
          Text(
            titulo,
            style: TextStyle(color: Colors.white),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = Icon(Icons.check);
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: backColor,
          child: child,
        ),
        Text(subtitulo)
      ],
    );
  }
}

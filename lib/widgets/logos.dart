import 'package:flutter/material.dart';

class Logos extends StatelessWidget {
  

  final String titulo;

  const Logos({super.key, required this.titulo});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Image( image: AssetImage('assets/logo.png'),),
            SizedBox(height: 20),
            Text( this.titulo , style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
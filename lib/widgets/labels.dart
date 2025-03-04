import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;

  const Labels({super.key, required this.ruta});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          this.ruta == 'login' ?
          Text('Ya tienes cuenta?', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300))
          :
          Text('No tienes cuenta?', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(

            child: 
            this.ruta == 'login' ?
            Text('Ingresa ahora!', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold))
            :
            Text('Crear cuenta', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.ruta);
              
            }
            ),
            
        ],
      ),
    );
  }
}
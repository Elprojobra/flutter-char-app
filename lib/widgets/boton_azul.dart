
import 'package:flutter/material.dart';


class BotonAzul extends StatelessWidget {
  
  final String text;
  final VoidCallback onPressed;

  const BotonAzul({super.key, required this.text, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
              elevation: 2,
              shadowColor: Colors.black, // Para simular highlightElevation
              backgroundColor: Colors.blue,
                      ),
                onPressed: this.onPressed,
                child:  Container(
                  width: double.infinity,
                  child: Center(
                  child: Text(this.text ,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255) , fontSize: 17),),
                  ),
                ),
     );
  }
}
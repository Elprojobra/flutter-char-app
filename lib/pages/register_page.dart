import 'package:chat_flutter/widgets/boton_azul.dart';
import 'package:chat_flutter/widgets/custom_input.dart';
import 'package:chat_flutter/widgets/labels.dart';
import 'package:chat_flutter/widgets/logos.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logos( titulo: 'Registro',),
                _Form(),
                Labels( ruta: 'login',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))
            
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Form extends StatefulWidget {

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {

  final emaCTlER = TextEditingController();
  final pastCtlr = TextEditingController();
  final nameCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
              icon: Icons.perm_identity,
              placeholder: 'Nombre',
              keyboardType: TextInputType.text,
              textController: nameCtlr,
              ),
              CustomInput(
              icon: Icons.mail_lock_outlined,
              placeholder: 'Correo',
              keyboardType: TextInputType.emailAddress,
              textController: emaCTlER,
              ),
              CustomInput(
              icon: Icons.lock_outlined,
              placeholder: 'Contraseña',
              textController: pastCtlr,
              isPassword: true,
              ),
              BotonAzul(
                text : 'Ingrese',
                onPressed: (){
                  print(emaCTlER.text);
                  print(pastCtlr.text);
                },
               )
        ],
      ),
    );
  }
}




import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String text;
  final String uid;
  final AnimationController animationController;

  ChatMessage({
    required this.text,
    required this.uid,
    required this.animationController
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123'
            ? _myMessage()
            : _notMyMessage(),
        ),
      ),
    );
  }
  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          bottom: 5,
          right: 5,
          left: 50,
        ),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          left: 5,
          bottom: 5,
          right: 50,
        ),
        child: Text(this.text, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 143, 143, 143),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
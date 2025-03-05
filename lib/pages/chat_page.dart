import 'dart:io';

import 'package:chat_flutter/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {


  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  final List<ChatMessage> _messages = [
    
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: <Widget>[
          CircleAvatar(
            child: Text('Te', style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blue[100],
            maxRadius: 14,
          ),
          SizedBox(height: 3),
          Text('Johan Cervantes', style: TextStyle(fontSize: 12)),
        ],
      ),
      centerTitle: true,
      elevation: 1,
     ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              height: 50,
              child: _inputChat(),
            ),
          ],
        )
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSumit,
                onChanged: (texto){
                  setState(() {
                      if  (texto.trim().length > 0){
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false;
                      }
                      }); 
                      },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enviar mensaje',
                    border: InputBorder.none,
                  ),
                  focusNode: _focusNode,
                ),
              ),

              // Botón de enviar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS
                ? CupertinoButton(
                  child: Text('Enviar'),
                  onPressed: _estaEscribiendo
                      ? () => _handleSumit(_textController.text.trim())
                      : null,
                )
                : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                    child: IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.send),
                      onPressed: _estaEscribiendo
                      ? () => _handleSumit(_textController.text.trim())
                      : null,
                    ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  _handleSumit( String texto ){

    if (texto.length == 0) return;

    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
    
    final newMessage = new ChatMessage(
      uid: '1233',
      text: texto,
      animationController: AnimationController(
        vsync: this, duration: Duration(milliseconds: 400)
      ),
    );
    
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (ChatMessage message in _messages){
      message.animationController.dispose();
    }

    //off del socket
    super.dispose();
  }
}
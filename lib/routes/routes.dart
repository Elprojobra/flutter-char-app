import 'package:chat_flutter/pages/chat_page.dart';
import 'package:chat_flutter/pages/loading_page.dart';
import 'package:chat_flutter/pages/login_page.dart';
import 'package:chat_flutter/pages/register_page.dart';
import 'package:chat_flutter/pages/usuarios_page.dart';
import 'package:flutter/widgets.dart';

final Map<String , Widget Function(BuildContext)> appRoutes = {

  'usuarios' : (_) => UsuariosPage(),
  'chat'     : (_) => ChatPage(),
  'loading'  : (_) => LoadingPage(),
  'login'    : (_) => LoginPage(),
  'register' : (_) => RegisterPage(),
};
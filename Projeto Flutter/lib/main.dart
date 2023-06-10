// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/criar_conta_page.dart';
import 'pages/login_page.dart';
import 'pages/tarefas_principal_page.dart';

Future<void> main() async {
  //
  // INICIALIZAÇÃO DO FIREBASE
  //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogação de Plantas',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'criar_conta': (context) => CriarContaPage(),
        'principal_page': (context) => TarefasPrincipalPage(),
      },
    ),
  );
}

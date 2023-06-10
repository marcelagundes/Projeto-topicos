import 'dart:js';

import 'package:app06_task_list/pages/cadastro_plantas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/homePage.dart';
import '../pages/util.dart';

class PlantasController {
  listarTudo() {
    return FirebaseFirestore.instance.collection('plantas');
  }

  void CadastrarPlantas(context, nome, especie, cientifico) {
    FirebaseFirestore.instance.collection('plantas').add(
      {
        'nome': nome,
        'especie': especie,
        'nomecientifico': cientifico,
        'uid': FirebaseAuth.instance.currentUser!.uid,
      },
    ).then((_) {
      sucesso(context, 'Planta cadastrada com sucesso.');
      Navigator.pop(context);
    }).catchError((error) => erro(context, error.code.toString()));
  }
}

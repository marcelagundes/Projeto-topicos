// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:app06_task_list/pages/tarefas_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import '../utils/menu.dart';
import 'tarefas_andamento_page.dart';
import 'tarefas_concluidas_page.dart';
import 'tarefas_page.dart';

class TarefasPrincipalPage extends StatefulWidget {
  const TarefasPrincipalPage({Key? key}) : super(key: key);

  @override
  State<TarefasPrincipalPage> createState() => _TarefasPrincipalPage();
}

class _TarefasPrincipalPage extends State<TarefasPrincipalPage> {
  var tarefas;

  // Telas de Navegecao
  final List<Widget> telas = [
    TarefasPage(),
    TarefasAndamentoPage(),
    TarefasConcluidasPage(),
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tarefas'),
        centerTitle: true,
      ),
      body: telas[index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_outlined,
            ),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.electric_bolt_outlined,
            ),
            label: 'Em andamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Concluído',
          ),
        ],
      ),
    );
  }
}

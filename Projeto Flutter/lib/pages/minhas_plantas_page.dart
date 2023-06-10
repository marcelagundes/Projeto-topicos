// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:app06_task_list/pages/plantas_exibir_widget.dart';
import 'package:flutter/material.dart';

import '../controller/plantas_controller.dart';
import '../utils/menu.dart';
import 'tarefas_exibir_widget.dart';

class MinhasPlantasPage extends StatefulWidget {
  const MinhasPlantasPage({Key? key}) : super(key: key);

  @override
  State<MinhasPlantasPage> createState() => _MinhasPlantasPageState();
}

class _MinhasPlantasPageState extends State<MinhasPlantasPage> {
  var minhasPlantas;

  @override
  void initState() {
    super.initState();
    minhasPlantas = PlantasController().listarTudo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Minhas Plantas'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey.shade50,
        child: Column(
          children: [
            PlantasExibirWidget(minhasPlantas),
          ],
        ),
      ),
    );
  }
}

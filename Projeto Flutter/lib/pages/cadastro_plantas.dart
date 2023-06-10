import 'package:app06_task_list/pages/cadastro_plantas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import '../controller/plantas_controller.dart';
import 'cadastro_plantas.dart';
import 'util.dart';

class CadastrarPlantas extends StatefulWidget {
  const CadastrarPlantas({Key? key}) : super(key: key);

  @override
  State<CadastrarPlantas> createState() => _CadastrarPlantasState();
}

class _CadastrarPlantasState extends State<CadastrarPlantas> {
  var txtNome = TextEditingController();
  var txtEspecie = TextEditingController();
  var txtCientifico = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cadastrar Plantas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      'Cadastro de Plantas',
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: Color.fromARGB(255, 4, 239, 74),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            campoTexto('Nome', Icons.abc, txtNome),
            campoTexto('Espécie', Icons.compost, txtEspecie),
            campoTexto('Nome Científico', Icons.science, txtCientifico),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              //Espécie
              // 'Nome Científico
              onPressed: () {
                var validationMessage = '';
                if (!txtNome.text.isNotEmpty) {
                  validationMessage = 'Informe o Nome.\n';
                }
                if (!txtEspecie.text.isNotEmpty) {
                  validationMessage =
                      validationMessage + 'Informe a Espécie.\n';
                }
                if (!txtCientifico.text.isNotEmpty) {
                  validationMessage =
                      validationMessage + 'Informe o Nome Científico.\n';
                }
                if (validationMessage == '') {
                  PlantasController().CadastrarPlantas(context, txtNome.text,
                      txtEspecie.text, txtCientifico.text);
                } else {
                  erro(context, validationMessage);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 17, 99, 69),
                minimumSize: Size(0.9, 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Salvar',
                style: GoogleFonts.roboto(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "Cancelar",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Color.fromARGB(255, 227, 241, 231),
                    ),
                  ),
                  onPressed: () => {Navigator.pop(context)},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

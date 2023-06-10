// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util.dart';

class PlantasExibirWidget extends StatefulWidget {
  final plantas;

  const PlantasExibirWidget(this.plantas, {Key? key}) : super(key: key);

  @override
  State<PlantasExibirWidget> createState() => _PlantasExibirWidgetState();
}

class _PlantasExibirWidgetState extends State<PlantasExibirWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.plantas.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      dynamic item = dados.docs[index].data();
                      String nome = item['nome'];
                      String especie = item['especie'];

                      return Card(
                        color: Color.fromARGB(255, 128, 255, 128),
                        child: ListTile(
                          title: Text(
                            nome,
                            style: GoogleFonts.roboto(fontSize: 22),
                          ),
                          subtitle: Text(
                            especie,
                            style: GoogleFonts.roboto(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhuma Planta Cadastrada.'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

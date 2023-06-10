import 'package:app06_task_list/pages/cadastro_plantas.dart';
import 'package:app06_task_list/pages/minhas_plantas_page.dart';
import 'package:app06_task_list/pages/tarefas_principal_page.dart';
import 'package:app06_task_list/pages/tarefas_page.dart';
import 'package:flutter/material.dart';

import '../pages/aboutIndex.dart';
import '../pages/login_page.dart';

class MenuWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final email = 'marcelagundes@gmail.com';
    final urlImage = 'assets/imagens/marcela.png';

    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 76, 175, 80),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              email: email,
              onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutIndex())),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Sobre',
                    icon: Icons.info,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Minhas Plantas',
                    icon: Icons.emoji_nature,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Cadastro de Plantas',
                    icon: Icons.nature,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Tarefas',
                    icon: Icons.nature_people,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Sair',
                    icon: Icons.exit_to_app,
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutIndex(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MinhasPlantasPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CadastrarPlantas(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TarefasPrincipalPage(),
        ));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
        break;
    }
  }
}

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import 'util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    txtEmail.text = '';
    txtSenha.text = '';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 95, 20),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 250,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset("assets/imagens/planta.png"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
              ),
              campoTexto('Email', Icons.email, txtEmail),
              campoTexto('Senha', Icons.lock, txtSenha, senha: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "Esqueceu a senha?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Color.fromARGB(255, 31, 157, 128),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Informe seu e-mail',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          titlePadding: EdgeInsets.all(20),
                          content: Container(
                            width: 350,
                            height: 80,
                            child: Column(
                              children: [
                                campoTexto('E-mail', Icons.email, txtEmail),
                              ],
                            ),
                          ),
                          backgroundColor: Color.fromARGB(255, 20, 95, 20),
                          actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(120, 50),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancelar',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 31, 157, 128),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 31, 157, 128),
                                minimumSize: Size(120, 50),
                              ),
                              onPressed: () async {
                                if (txtEmail.text.isNotEmpty) {
                                  LoginController()
                                      .esqueceuSenha(txtEmail.text);
                                  sucesso(
                                      context, 'E-mail enviado com sucesso.');
                                } else {
                                  erro(context,
                                      'Informe o e-mail para recuperar a senha.');
                                }

                                Navigator.pop(context);
                              },
                              child: Text(
                                'Enviar',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  var validationMessage = '';
                  if (!txtEmail.text.isNotEmpty) {
                    validationMessage = 'Informe o E-mail.\n';
                  }
                  if (!txtSenha.text.isNotEmpty) {
                    validationMessage =
                        validationMessage + 'Informe a Senha.\n';
                  }

                  if (validationMessage == '') {
                    LoginController()
                        .login(context, txtEmail.text, txtSenha.text);
                  } else {
                    erro(context, validationMessage);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 31, 157, 128),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Entrar',
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
                      "Novo usuário?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Color.fromARGB(255, 31, 157, 128),
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushNamed(context, 'criar_conta')},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

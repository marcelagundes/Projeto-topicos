import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '../utils/menu.dart';
import 'aboutDetails.dart';

class AboutIndex extends StatelessWidget {
  const AboutIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: MenuWidget(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Informações'),
          centerTitle: true,
        ),
        body: IntroViewsFlutter(
          pages,
          onTapDoneButton: () {},
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      );
}

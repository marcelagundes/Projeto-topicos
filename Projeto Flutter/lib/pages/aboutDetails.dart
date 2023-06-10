import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

final pages = [
  PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      iconImageAssetPath: '/imagens/lirio.png',
      body: const Text(
          'O objetivo do aplicativo seria catalogação e aprendizado sobre tipos de plantas encontradas no mundo.'),
      title: const Text(
        'Objetivo sobre o aplicativo',
      ),
      textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        '/imagens/lirio.png',
        height: 400.0,
        width: 400.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),
    iconImageAssetPath: '/imagens/flor.png',

    body: const Text(
        'Também ajudamos você quando estiver com dúvidas de como cuidar da sua plantinha   '),
    title: const Text('Cuidados com as plantas'),
    mainImage: Image.asset(
      '/imagens/flor.png',
      height: 400.0,
      width: 400.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: const Color(0xFF607D8B),
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    iconImageAssetPath: '/imagens/brotos.png',
    body: const Text(
        'A Desenvolvedora responsavel pelo aplicativo Marcela Jorge Fagundes'),
    title: const Text('Desensenvolvedor'),
    mainImage: Image.asset(
      '/imagens/marcela.png',
      height: 400.0,
      width: 400.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
];

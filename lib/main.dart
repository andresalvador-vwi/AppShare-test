import 'package:flutter/material.dart';
import 'package:testeapp/app/views/homePage/home.dart';
import 'package:testeapp/app/views/uiFuncionalPage/funcional.dart';

import 'app/views/receberDadosPage/receberDados.dart';
void main(){
  runApp(
    MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
      },
      home: HomeScreen(),
    )
  );
}
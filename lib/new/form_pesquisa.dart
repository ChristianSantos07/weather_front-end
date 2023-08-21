
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

/*

Classe de formulário para campos de interação com o usuário
Nessa Aplicação temos apenas o cmapo de pesquisa, no Widget central

 */

class FormPesquisa extends StatelessWidget {
  String hint;
  String label;
  TextEditingController controller;
  Color fillCor;
  IconData? icon2;
  Function()? click;


  FormPesquisa(
      {Key? key,
        required this.hint,
        required this.controller,
        required this.label,
        required this.fillCor,
        this.icon2,
        this.click,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: Colors.black87),
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.black87),
        fillColor: fillCor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 37, 41, 38),),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black87),
        ),
        suffixIcon: IconButton(
          onPressed: click,
          icon: Icon(icon2, color: Colors.black),

        ),
      ),

      style: const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
    );

  }
}


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;





class GetController extends GetxController {
  static GetController get to => Get.find();

  /*
  Gerenciador de estado do aplicativo, ele é responsável por efetuar chamadas de API,
  tomada de decisões e notificar a tela sobre atualizações de dados

   */
  ///Váriavel responsável por não mostrar informações desnecessárias antes de solicitar a API a pesquisa de uma cidade
  bool showWeather = false;

  ///Váriavel de configuração do chaminho d API
  var url = 'http://localhost:5000/';

  ///Váriavel responsável pelo campo de pesquisa da cidade
  TextEditingController controllerPesquisa = TextEditingController();

  ///Váriaveis de listas
  List historic= [], proximoDia = [];

  ///Váriaveis de String
  String cidade = "", icon = "", pais = "", temp = "", temp_max = "", temp_min = "", previsao = "", umidade = "", data = "", vento = "", histCidade = "", hisDate = "";


  ///Atualiza os dados de texto e notifica a tela sobre a mudança
void recupera_histico(map){
  data = map['data'];
  icon = map['icon'];
  previsao = map['previsao'];
  temp = map['temp'];
  temp_max = map['temp_max'];
  temp_min = map['temp_min'];
  umidade = map['umidade'];
  vento = map['vento'];
  controllerPesquisa.text = cidade;
  update();
}


  ///Atualiza os dados de texto e notifica a tela sobre a mudança
  void atualizar_dados(context, map) {
    if (map['code'] == 1){
      cidade = map['cidade'];
      pais = map['pais'];
      data = map['data'];
      icon = map['icon'];
      previsao = map['previsao'];
      temp = map['temp'];
      temp_max = map['temp_max'];
      temp_min = map['temp_min'];
      umidade = map['umidade'];
      vento = map['vento'];
      controllerPesquisa.text = cidade;
      update();
    }else{
      snack(context, map['msg'], Colors.red);
    }
    update();
  }


  ///End-point resposável pelos retornos da API, retorna listas
  Future<List?> connectApi(context, arg, param) async {
    final response = await http.get(Uri.parse('${url}${param}'));

    var map = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (arg == 'buscaHistorico'){
        historic = map;
        print(historic);
        update();
      }else if(arg == 'atualizaPrincipal'){
        print(map);
        showWeather = true;
        atualizar_dados(context, map);
      }else{
        proximoDia = map;
        update();
      }
    } else {
      snack(context, "${map['error']}: ${response.statusCode}", Colors.red);
    }
  }

  ///Modelo de estilo de texto, com parametro size
  TextStyle styleText(double size) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  ///Snackbar de aviso
  snack(context, String txt, Color cor ) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    var snackBar = SnackBar(
        backgroundColor: cor,
        content: Text(
          txt,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }





}

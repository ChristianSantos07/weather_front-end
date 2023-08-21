import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_linx/home/gerenciado_estado.dart';

class ScreenNextDay extends StatelessWidget {
  const ScreenNextDay({super.key});

  @override
  Widget build(BuildContext context) {

    final GetController get = Get.put(GetController());

    return GetBuilder<GetController>(builder: (_) {

      /*
      Widget Lateral direito
      Responsável por mostrar os dados da previsão do tempo dos próximos dias e tabém enviar informações para o widget central
      quando foi solicitado ver alguma data futura.

       */

      return Container(
          height: 500,
          width: 300,
          //color: Color.fromRGBO(147, 112, 219, 100),
          decoration: BoxDecoration(
            //color: Color.fromARGB(255, 0,0,128),
              color: Colors.deepPurple,
              border: Border.all(
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(15))),


          child: Column(
            children: [
              Text('Próximos dias:',style: get.styleText(15),),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: get.proximoDia.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                            title: Text('${get.proximoDia[index]['previsao']}  \n Min/Max: ${get.proximoDia[index]['temp_min']} ~${get.proximoDia[index]['temp_max']} \n ${get.proximoDia[index]['data']}', textAlign: TextAlign.center, style: get.styleText(15),),
                            onTap: () async {
                              var map = get.proximoDia[index];
                              get.recupera_histico(map);

                            }
                        ),
                        Divider(
                            color: Colors.white, indent: 20, endIndent: 20),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

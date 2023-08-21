import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gerenciado_estado.dart';

class ScreenHistoricCity extends StatelessWidget {
  const ScreenHistoricCity({super.key});

  @override
  Widget build(BuildContext context) {

    final GetController get = Get.put(GetController());

    return GetBuilder<GetController>(builder: (_) {

      /*
      Widget lateral esquerdo
      Responsável por mostrar os dados do histórico, Cidade e data, e por enviar dados para o widget central quando solicitado ver o histórico.
      e ao ver o histórico é tambem atualizado a lista dos futuros dias do historico (porem em tempo real)

       */


      return Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              border: Border.all(
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(15))),
          child: Column(
            children: [
              Text('Cidades recentes:',style: get.styleText(20), ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: get.historic.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('${get.historic[index]['cidade']} \n ${get.historic[index]['data']}', textAlign: TextAlign.center, style: get.styleText(15),),
                          onTap: () async {
                            await get.connectApi(context, 'atualizaPrincipal', 'listHistoric?identidade=${get.historic[index]['identidade']}');
                            await get.connectApi(context, 'a', 'forecast?city=${get.historic[index]['cidade']}');
                          },
                        ),
                        const Divider(
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_pesquisa.dart';
import 'gerenciado_estado.dart';

class ScreenWeather extends StatelessWidget {
  const ScreenWeather({super.key});

  @override
  Widget build(BuildContext context) {

    final GetController get = Get.put(GetController());

    return GetBuilder<GetController>(builder: (_) {

      /*
      Widget Central
      Responsável por mostrar os dados da previsão do tempo quando recber da API, e também pela pesquisa

       */


        return Card(
          elevation: 12,
          //color: Color.fromARGB(255, 25,25,112),
          color: const Color.fromARGB(255, 72,61,139),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            //decoration: gradientBoxDecoration(startColor: startColor, endColor: endColor, begin: Alignment.topLeft, end: Alignment.bottomRight),
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            width: 500,
            child: Column(
              children: [
                Text(
                  'Escolha uma cidade:',
                  style: get.styleText(20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FormPesquisa(
                            hint: 'Escolha a cidade',
                            controller: get.controllerPesquisa,
                            label: 'cidade',
                            fillCor: Colors.white),
                      ),
                    ),
                    IconButton(
                        tooltip: 'Pesquisar',
                        onPressed: () async {
                          await get.connectApi(context, 'atualizaPrincipal', 'weather?city=${get.controllerPesquisa.text}');
                          await get.connectApi(context, 'a', 'forecast?city=${get.controllerPesquisa.text}');
                          await get.connectApi(context, 'buscaHistorico', 'historic');
                        },
                        splashColor: null,
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  height: 1,
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: get.showWeather? true : false,
                  child: Column(
                    children: [
                      Text(
                          get.data,
                          style: get.styleText(20)
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            get.cidade,
                            style: get.styleText(20),),
                          const SizedBox(width: 20),
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.network(get.pais)
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        get.temp,
                        style: get.styleText(20),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Min/Max:  ${get.temp_min} ~ ${get.temp_max}',
                        style: get.styleText(15),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            get.previsao,
                            style: get.styleText(20),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(get.icon),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.opacity_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              get.umidade,
                              style: get.styleText(20),
                            ),
                            const SizedBox(width: 20),
                            const VerticalDivider(
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.air,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              get.vento,
                              style: get.styleText(20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

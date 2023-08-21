import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_linx/new/gerenciado_estado.dart';
import 'package:teste_linx/new/screen_historic_city.dart';
import 'package:teste_linx/new/screen_next_day.dart';
import 'package:teste_linx/new/screen_weather.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    final GetController get = Get.put(GetController());
    super.initState();
    get.connectApi(context, 'buscaHistorico', 'historic');
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;



    /*

    Tela inicial do Aplicativo (stateful).
    Responsavél pela união dos 3 principais Widget

    ScreenHistoricCity - Lateral esquerda
    ScreenWeather - Central
    ScreenNextDay - Lateral direito

     */

    final GetController get = Get.put(GetController());


    return GetBuilder<GetController>(builder: (_) {
      return Scaffold(
        body: Container(
          height: altura,
          width: largura,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.withOpacity(1),
                Colors.deepPurple.withOpacity(1),
                Colors.white.withOpacity(1),
                Colors.white.withOpacity(1),
                //Color(0xFFFAA0C4).withOpacity(1),
              ],
              //stops: [0.0, 0.5, 1.0],
              end: Alignment.bottomRight,
              begin: Alignment.topLeft,
              transform: const GradientRotation(45),
            ),
          ),
          child: Stack(
            children: [
              ///Widget central, responsável por mostrar o clima
              const Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: ScreenWeather()
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ///Widget da lateral esquerda, responsável por mostrar o histórico de pesquisa
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Visibility(
                        visible: get.historic.isEmpty? false : true,
                          child: const ScreenHistoricCity())
                    ),
                    const Expanded(child: SizedBox()),
                    ///Widget da lateral direita, responsável por mostrar o clima dos próximos dias
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Visibility(
                        visible: get.showWeather? true : false,
                          child: const ScreenNextDay())
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:severino_trasportes/data.dart';
import 'package:severino_trasportes/telas/julio.dart';
import 'package:severino_trasportes/telas/junior.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Data> users = [
    Data(image: "assets/imgs/junior.jpg", text: "JUNIOR"),
    Data(image: "assets/imgs/julio.jpg", text: "JULIO")
  ];

  int? indexSelecionado; // Variável para armazenar o índice selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Severino Transportes',
          style: TextStyle(
              color: Colors.white, fontFamily: 'FiraSansB', fontSize: 25),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha o conteúdo
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    'Bem-vindo!',
                    style: TextStyle(fontFamily: 'FiraSansB', fontSize: 25),
                  ),
                ),
                const SizedBox(height: 25),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Para gerar o orçamento selecione um dos usuários abaixo:',
                      style: TextStyle(fontSize: 20, fontFamily: 'FiraSansB'),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    bool seSelecionado = indexSelecionado ==
                        index; // Verifica se o item está selecionado

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexSelecionado =
                              index; // Atualiza o índice selecionado
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color:
                                      seSelecionado ? Colors.red : Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(users[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(
                                height: 5,
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(users[index].text,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'FiraSansB',
                                          color: seSelecionado
                                              ? Colors.red
                                              : Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
                TextButton(
                  onPressed: indexSelecionado != null
                      ? () {
                          _telas(indexSelecionado!);
                        }
                      : null,
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Continuar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'FiraSansB',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '© 2024 - Gabriel Coelho Severino',
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _telas(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Junior(),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Julio(),
        ),
      );
    }
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Severino Transportes',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Lobster', fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Bem-vindo!',
                  style: TextStyle(fontFamily: 'Lobster', fontSize: 20)),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Para gerar o orçamento selecione um dos usuários abaixo:',
                  style: TextStyle(fontSize: 20, fontFamily: 'FiraSansB'),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            SizedBox(height: 80),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: users.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.9),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _telas(index);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(width: 6, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(users[index].image),
                                  fit: BoxFit.cover)),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              users[index].text,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'FiraSansB',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                '© 2024 - Gabriel Coelho Severino',
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _telas(int index) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Junior(),
          ));
    }
    if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Julio(),
          ));
    }
  }
}

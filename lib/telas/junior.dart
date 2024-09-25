import 'package:flutter/material.dart';

class Junior extends StatefulWidget {
  const Junior({super.key});

  @override
  State<Junior> createState() => _JuniorState();
}

class _JuniorState extends State<Junior> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose(); // Limpa o controlador de data
    _valueController.dispose(); // Limpa o controlador de valor
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(
          2101,
        ));

    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}"
            .split(' ')[0]; // Formata a data como 'YYYY-MM-DD'
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Severino Transportes',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Lobster', fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'Junior Fretes e Mudanças',
                  style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o Nome do Cliente',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'De onde:',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Para Onde:',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontFamily: 'FiraSansB'),
              controller: _valueController, // Controlador para o campo de valor
              keyboardType: TextInputType.number, // Apenas teclado numérico
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o Valor',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontFamily: 'FiraSansB'),
              controller: _dateController, // Controlador para o campo de data
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Data do Serviço',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
                suffixIcon: Icon(Icons.calendar_today), // Ícone de calendário
              ),
              readOnly: true, // Somente leitura
              onTap: () {
                _selectDate(context); // Abre o seletor de data
              },
            ),
            SizedBox(height: 40),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    'Realizar Orçamento',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Junior(),
  ));
}

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class Julio extends StatefulWidget {
  const Julio({super.key});

  @override
  State<Julio> createState() => _JuniorState();
}

class _JuniorState extends State<Julio> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _valueController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        _dateController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  Future<void> _generateAndOpenPDF() async {
    // Cria um documento PDF
    final pdf = pw.Document();

    // Adiciona uma página ao documento com as informações coletadas
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 100),
              pw.Text(
                'TR Julio',
                style: pw.TextStyle(
                  fontSize: 24,
                  color: PdfColors.red900,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text('CNPJ: 22.003.918/0001-27',
                  style: pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 40),
              pw.Text('Orçamento',
                  style: pw.TextStyle(fontSize: 24, color: PdfColors.red900)),
              pw.SizedBox(height: 5),
              pw.Text(
                'Data: ${_dateController.text}',
                style: pw.TextStyle(fontSize: 14, color: PdfColors.red900),
              ),
              pw.SizedBox(height: 50),
              pw.Text('Ao Cliente',
                  style: pw.TextStyle(fontSize: 24, color: PdfColors.red900)),
              pw.SizedBox(height: 5),
              pw.Text('${_nameController.text}',
                  style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 50),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Serviço', style: pw.TextStyle(fontSize: 14)),
                  pw.Text('Descrição', style: pw.TextStyle(fontSize: 14)),
                  pw.Text('Valor', style: pw.TextStyle(fontSize: 14)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(color: PdfColors.red900, thickness: 2),
              pw.SizedBox(height: 50),
              pw.Row(
                children: [
                  pw.Text('Serviço Transporte',
                      style: pw.TextStyle(fontSize: 14)),
                  pw.SizedBox(width: 30),
                  pw.Text(
                    softWrap: true,
                    'De ${_fromController.text} para ${_toController.text}',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                  pw.SizedBox(width: 40),
                  pw.Text('R\$ ${_valueController.text}',
                      style: pw.TextStyle(fontSize: 14)),
                ],
              ),
              pw.SizedBox(height: 60),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Container(
                    height: 40,
                    width: 170,
                    decoration: pw.BoxDecoration(color: PdfColors.red900),
                    child: pw.Center(
                      child: pw.Text('Total: R\$ ${_valueController.text}',
                          style: pw.TextStyle(
                              fontSize: 20, color: PdfColors.white)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

    // Obtém o diretório para salvar o arquivo temporariamente
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/orcamento.pdf';

    // Salva o PDF como um arquivo
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // Abre o arquivo PDF
    await OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Severino Transportes',
          style: TextStyle(
              color: Colors.white, fontFamily: 'FiraSansB', fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'TR Julio',
                  style: TextStyle(fontFamily: 'FiraSansB', fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _nameController,
              style: const TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Digite o Nome do Cliente',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _fromController,
              style: const TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'De onde:',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _toController,
              style: const TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Para Onde:',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _valueController,
              style: const TextStyle(fontFamily: 'FiraSansB'),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Digite o Valor',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              style: const TextStyle(fontFamily: 'FiraSansB'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Data do Serviço',
                fillColor: Colors.white38,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18)),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 40),
            TextButton(
                onPressed: _generateAndOpenPDF,
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Realizar Orçamento',
                    style: TextStyle(
                        fontFamily: 'FiraSansB',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Julio extends StatefulWidget {
  const Julio({super.key});

  @override
  State<Julio> createState() => _JulioState();
}

class _JulioState extends State<Julio> {
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
    );
  }
}

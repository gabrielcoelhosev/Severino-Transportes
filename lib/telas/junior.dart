import 'package:flutter/material.dart';

class Junior extends StatefulWidget {
  const Junior({super.key});

  @override
  State<Junior> createState() => _JuniorState();
}

class _JuniorState extends State<Junior> {
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

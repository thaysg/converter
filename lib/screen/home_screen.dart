import 'dart:math';
import 'package:converter/brain/verse_brain.dart';
import 'package:converter/components/my_image.dart';
import 'package:converter/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String verseButton = "";
  int versiculoSorteado;

  void gerarVersiculo() {
    var versiculoSorteado = Random().nextInt(versiculos.length);
    //atualizar a pagina com o versiculo gerado - utiliza um setState
    setState(() {
      verseButton = versiculos[versiculoSorteado];
    });
  }

  @override
  void initState() {
    super.initState();
    gerarVersiculo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gerador de Versículos',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          MyImage(
            picture: AssetImage(
              'images/paper.jpg',
            ),
          ),
          Center(
            child: MyText(
              title: verseButton,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffff1a1a),
        elevation: 2,
        onPressed: () {
          gerarVersiculo();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

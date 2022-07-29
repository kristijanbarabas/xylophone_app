import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);
  // funkcija za reprodukciju zvukova
  void playSound(int soundNumber) async {
    // prvo kreiramo player
    final player = AudioPlayer();
    // pozovemo player i dodamo metodu play i u njoj navedemo izvor i assetsa i koji je to file
    // ne moramo upisati puni file path npr. assets/note1.wav nego možemo samo naziv filea
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  // funkcija za kreiranje elemenata xylophonea
  // data type funkcije je Expanded jer returna expanded widget
  // funkcija prima dva argumenta, jedan je color koji mijenja boju widgeta, a drugi je soundNumber koji povezuje sa kreiranom funkcijom playSound() i vraća zvuk pomoću broja
  Expanded buildKey({required Color? color, required int soundNumber}) {
    return Expanded(
      child: RawMaterialButton(
        enableFeedback: false,
        fillColor: color,
        onPressed: () async {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // kako bismo kreirali 7 tipki pozovemo buildKey funkciju i postavimo potrebne argumente
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.teal, soundNumber: 5),
                buildKey(color: Colors.blue, soundNumber: 6),
                buildKey(color: Colors.purple, soundNumber: 7),
              ],
            ),
          ),
        ));
  }
}

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int keyNumber) {
    final player = AudioCache();
    player.play('note$keyNumber.wav');
  }

  Expanded buildKey({int keyNumber, Color keyColor}) => Expanded(
        child: FlatButton(
          color: keyColor,
          onPressed: () {
            playSound(keyNumber);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(keyColor: Colors.red, keyNumber: 1),
                buildKey(keyColor: Colors.orange, keyNumber: 2),
                buildKey(keyColor: Colors.yellow, keyNumber: 3),
                buildKey(keyColor: Colors.green, keyNumber: 4),
                buildKey(keyColor: Colors.teal, keyNumber: 5),
                buildKey(keyColor: Colors.blue, keyNumber: 6),
                buildKey(keyColor: Colors.purple, keyNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

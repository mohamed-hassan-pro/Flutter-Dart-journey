import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class TuneModel {
  final String soundAsset;
  final Color color;
  const TuneModel({required this.color, required this.soundAsset});

  void playSound() {
    AudioPlayer().play(AssetSource(soundAsset));
  }
}

import 'package:_04_tunes_player_app/models/tune_model.dart';
import 'package:flutter/material.dart';
import '../widgets/expanded_tune_item.dart';

class TunesView extends StatelessWidget {
  const TunesView({super.key});
  final List<TuneModel> tunes = const [
    TuneModel(color: Color(0xfffe3f39), soundAsset: 'note1.wav'),
    TuneModel(color: Color(0xfffd972b), soundAsset: 'note2.wav'),
    TuneModel(color: Color(0xfffdeb56), soundAsset: 'note3.wav'),
    TuneModel(color: Color(0xff33af57), soundAsset: 'note4.wav'),
    TuneModel(color: Color(0xff009587), soundAsset: 'note5.wav'),
    TuneModel(color: Color(0xff0097ed), soundAsset: 'note6.wav'),
    TuneModel(color: Color(0xffa227ac), soundAsset: 'note7.wav'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff243139),
        title: Text(
          'Tunes',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: tunes.map((tune) => ExpandedTuneItem(tune: tune)).toList(),
      ),
    );
  }
}

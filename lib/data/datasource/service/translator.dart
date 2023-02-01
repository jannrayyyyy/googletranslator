import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

class TranslatorService {
  final _translator = GoogleTranslator();
  final flutterTts = FlutterTts();
  final speach = SpeechToText();

  void translator({
    required String text,
    required String from,
    required String to,
    required FutureOr<dynamic> Function(Translation) onTranslated,
  }) async {
    _translator.translate(text, from: from, to: to).then(onTranslated);
  }

  void speak({required String text, required String to}) async {
    await flutterTts.setLanguage(to);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  Future<bool> toggleRecording({
    required bool isSender,
    required Function(SpeechRecognitionResult) onResult,
    required ValueChanged<bool> onListening,
    required String? fromValue,
    required String? toValue,
  }) async {
    final isAvailable = await speach.initialize(
        onStatus: (status) => onListening(speach.isListening),
        onError: (e) => print('Error: $e'));

    if (isAvailable) {
      await speach.listen(
        localeId: isSender ? fromValue : toValue,
        onResult: onResult,
      );
    }
    return isAvailable;
  }
}

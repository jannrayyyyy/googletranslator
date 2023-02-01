import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String result) onResult,
  }) async {
    final isAvailable = await speech.initialize();
    if (isAvailable) {
      speech.listen(
        onResult: (result) => onResult(result.recognizedWords),
      );
    }
    return isAvailable;
  }
}

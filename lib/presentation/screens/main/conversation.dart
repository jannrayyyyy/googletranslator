import 'package:a_translator/data/datasource/service/translator.dart';
import 'package:a_translator/presentation/widgets/components/main/conversation_translator/footer.dart';
import 'package:a_translator/presentation/widgets/components/main/conversation_translator/header.dart';
import 'package:a_translator/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../widgets/components/main/conversation_translator/body.dart';

class ConversationScreen extends StatefulWidget {
  final String? fromLangtext;
  final String? fromValue;
  final String? toLangText;
  final String? toValue;
  const ConversationScreen({
    super.key,
    this.fromLangtext,
    this.fromValue,
    this.toLangText,
    this.toValue,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<Widget> convo = [];
  String rawTextHolder = '';
  String translatedTextHolder = '';
  final translatorService = TranslatorService();

  bool isLeftListening = false;
  bool isRightListening = false;
  final flutterTTs = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ConversationHeader(
            fromLangtext: widget.fromLangtext,
            fromValue: widget.fromValue,
            toLangText: widget.toLangText,
            toValue: widget.toValue,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: convo.isEmpty
                ? const Center(
                    child: CustomText(
                      'Toggle the record button\nto begin a conversation',
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          children: convo.map((e) {
                        return e;
                      }).toList()),
                    ),
                  ),
          ),
          const SizedBox(height: 8),
          ConversationFooter(
            isLeft: true,
            leftColor: isLeftListening ? Colors.green[300] : Colors.white,
            rightColor:
                isRightListening ? Colors.green[300] : const Color(0XFFEAEAEA),
            toggleLeftRecoding: () async {
              // startListening(true);
              TranslatorService().toggleRecording(
                isSender: true,
                onResult: (result) {
                  if (result.finalResult) {
                    translatorService.translator(
                      text: result.recognizedWords,
                      from: widget.fromValue ?? 'en',
                      to: widget.toValue ?? 'en',
                      onTranslated: (value) {
                        translatedTextHolder = value.text;
                        setState(() {
                          convo.add(
                            ConversationBody(
                              isSender: true,
                              rawText: result.recognizedWords,
                              translatedText: translatedTextHolder,
                            ),
                          );
                        });
                      },
                    );
                  }
                },
                onListening: (isListening) {
                  setState(() {
                    isLeftListening = isListening;
                  });
                },
                fromValue: widget.fromValue,
                toValue: widget.toValue,
              );
            },
            onDelete: () {
              setState(() {
                convo.clear();
              });
            },
            toggleRightRecoding: () {
              // startListening(false);
              TranslatorService().toggleRecording(
                isSender: false,
                onResult: (result) {
                  if (result.finalResult) {
                    translatorService.translator(
                      text: result.recognizedWords,
                      from: widget.toValue ?? 'en',
                      to: widget.fromValue ?? 'en',
                      onTranslated: (value) {
                        translatedTextHolder = value.text;
                        setState(() {
                          convo.add(
                            ConversationBody(
                              isSender: false,
                              rawText: result.recognizedWords,
                              translatedText: translatedTextHolder,
                            ),
                          );
                        });
                      },
                    );
                  }
                },
                onListening: (isListening) {
                  setState(() {
                    isRightListening = isListening;
                  });
                },
                fromValue: widget.fromValue,
                toValue: widget.toValue,
              );
            },
          )
        ],
      ),
    );
  }
}

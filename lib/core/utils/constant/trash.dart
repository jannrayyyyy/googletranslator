
  // Future startListening(bool isSender) async {
  //   isSender
  //       ? await flutterTTs.listen(
  //           onResult: (SpeechRecognitionResult result) {
  //             if (result.finalResult) {
  //               isSender
  //                   ? translatorService.translator(
  //                       text: result.recognizedWords,
  //                       from: widget.fromValue ?? 'en',
  //                       to: widget.toValue ?? 'en',
  //                       onTranslated: (value) {
  //                         translatedTextHolder = value.text;
  //                         setState(() {
  //                           convo.add(
  //                             ConversationBody(
  //                               isSender: true,
  //                               rawText: result.recognizedWords,
  //                               translatedText: translatedTextHolder,
  //                             ),
  //                           );
  //                         });
  //                       },
  //                     )
  //                   : translatorService.translator(
  //                       text: result.recognizedWords,
  //                       from: widget.toValue ?? 'en',
  //                       to: widget.fromValue ?? 'en',
  //                       onTranslated: (value) {
  //                         translatedTextHolder = value.text;
  //                         print('translated result00: $translatedTextHolder');
  //                         setState(() {
  //                           convo.add(
  //                             ConversationBody(
  //                               isSender: false,
  //                               rawText: result.recognizedWords,
  //                               translatedText: translatedTextHolder,
  //                             ),
  //                           );
  //                         });
  //                       },
  //                     );
  //             }
  //           },
  //         )
  //       : await flutterTTs.listen(
  //           localeId: widget.toValue,
  //           onResult: (SpeechRecognitionResult result) {
  //             if (result.finalResult) {
  //               isSender
  //                   ? translatorService.translator(
  //                       text: result.recognizedWords,
  //                       from: widget.fromValue ?? 'en',
  //                       to: widget.toValue ?? 'en',
  //                       onTranslated: (value) {
  //                         translatedTextHolder = value.text;
  //                         print('translated result00: $translatedTextHolder');
  //                         setState(() {
  //                           convo.add(
  //                             ConversationBody(
  //                               isSender: true,
  //                               rawText: result.recognizedWords,
  //                               translatedText: translatedTextHolder,
  //                             ),
  //                           );
  //                         });
  //                       },
  //                     )
  //                   : translatorService.translator(
  //                       text: result.recognizedWords,
  //                       from: widget.toValue ?? 'en',
  //                       to: widget.fromValue ?? 'en',
  //                       onTranslated: (value) {
  //                         translatedTextHolder = value.text;
  //                         print('translated result00: $translatedTextHolder');
  //                         setState(() {
  //                           convo.add(
  //                             ConversationBody(
  //                               isSender: false,
  //                               rawText: result.recognizedWords,
  //                               translatedText: translatedTextHolder,
  //                             ),
  //                           );
  //                         });
  //                       },
  //                     );
  //             }
  //           },
  //         );
  // }



  
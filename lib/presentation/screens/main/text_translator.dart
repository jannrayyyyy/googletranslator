import 'package:a_translator/core/utils/customs/custom_functions.dart';
import 'package:a_translator/data/datasource/service/translator.dart';
import 'package:a_translator/main.dart';
import 'package:a_translator/presentation/widgets/customs/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import '../../../domain/entities/favotire_entity.dart';
import '../../bloc/favorite/favorite_bloc.dart';
import '../../widgets/components/main/text_translator/pop_up.dart';

class TextTranslatorScreen extends StatefulWidget {
  final String? fromLangtext;
  final String? fromValue;
  final String? toLangText;
  final String? toValue;
  const TextTranslatorScreen({
    super.key,
    this.fromLangtext,
    this.fromValue,
    this.toLangText,
    this.toValue,
  });

  @override
  State<TextTranslatorScreen> createState() => _TextTranslatorScreenState();
}

class _TextTranslatorScreenState extends State<TextTranslatorScreen> {
  final rawText = TextEditingController();
  final translatedText = TextEditingController();
  final translatorService = TranslatorService();
  int id = 0;

  int rawTextLength = 0;
  int translatedTextLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLangPopUp(
                    langText: widget.fromLangtext,
                    isTrue: true,
                  ),
                  CustomTextField(
                    controller: rawText,
                    hint: 'Translate text here',
                    length: rawTextLength,
                    onChanged: (value) {
                      setState(() {
                        rawTextLength = value.length;
                      });
                    },
                    button: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (rawText.text.isNotEmpty) {
                              translatorService.translator(
                                text: rawText.text,
                                from: widget.fromValue ?? 'en',
                                to: widget.toValue ?? 'en',
                                onTranslated: (value) {
                                  setState(() {
                                    translatedText.text = value.text;
                                    translatedTextLength = value.text.length;
                                  });
                                },
                              );
                            } else {
                              CustomFunctions.showCustomSnackBar(
                                context: context,
                                color: Colors.red,
                                content: 'Field is Empty',
                              );
                            }
                          },
                          icon: const Iconify(MaterialSymbols.g_translate),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomLangPopUp(
                    langText: widget.toLangText,
                    isTrue: false,
                  ),
                  CustomTextField(
                    controller: translatedText,
                    hint: 'Translated text here',
                    length: translatedTextLength,
                    onChanged: (value) {
                      setState(() {
                        translatedTextLength = value.length;
                      });
                    },
                    button: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (translatedText.text.isEmpty) {
                            } else {
                              Clipboard.setData(
                                ClipboardData(
                                  text: translatedText.text,
                                ),
                              ).then((value) {
                                CustomFunctions.showCustomSnackBar(
                                  context: context,
                                  color: Colors.black,
                                  content: 'Copied to clipboard',
                                );
                              });
                            }
                          },
                          icon: const Icon(Icons.copy),
                        ),
                        IconButton(
                          onPressed: () {
                            translatorService.speak(
                              text: translatedText.text,
                              to: widget.toValue ?? 'en',
                            );
                          },
                          icon: const Iconify(Ic.sharp_spatial_audio_off),
                        ),
                        IconButton(
                          onPressed: () {
                            globalSharedPref
                                ?.setInt('id',
                                    (globalSharedPref?.getInt('id') ?? 0) + 1)
                                .then((value) {
                              final favorite = FavoriteEntity(
                                id: globalSharedPref?.getInt('id') ?? 0,
                                fromValue: widget.fromLangtext ?? 'English',
                                rawText: rawText.text,
                                toValue: widget.toLangText ?? 'English',
                                translatedText: translatedText.text,
                              );
                              context
                                  .read<FavoriteBloc>()
                                  .add(AddValueEvent(favorite: favorite));
                            });
                          },
                          icon: const Iconify(MaterialSymbols.favorite),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocListener<FavoriteBloc, FavoriteState>(
                listener: (context, state) {
                  if (state is FavoriteLoading) {
                    print('loading');
                  } else if (state is LoadingSuccessful) {
                    print('success na');
                    print(globalSharedPref?.getInt('id') ?? 0);
                  }
                },
                child: Container(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

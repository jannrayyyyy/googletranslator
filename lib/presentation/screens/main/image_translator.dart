import 'dart:io';

import 'package:a_translator/core/utils/customs/custom_functions.dart';
import 'package:a_translator/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/datasource/service/translator.dart';
import '../../bloc/translator/from_value/from_value_cubit.dart';
import '../../bloc/translator/to_value/to_value_cubit.dart';
import '../../widgets/customs/mirai_popup_menu.dart';
import '../../widgets/customs/textfield.dart';

class ImageTranslatorScreen extends StatefulWidget {
  final String? fromLangtext;
  final String? fromValue;
  final String? toLangText;
  final String? toValue;
  const ImageTranslatorScreen({
    super.key,
    this.fromLangtext,
    this.fromValue,
    this.toLangText,
    this.toValue,
  });

  @override
  State<ImageTranslatorScreen> createState() => _ImageTranslatorScreenState();
}

class _ImageTranslatorScreenState extends State<ImageTranslatorScreen> {
  final controller = TextEditingController();
  bool isScanning = false;
  XFile? imageFile;
  String scannedText = '';
  bool isDone = false;
  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        isScanning = true;
        imageFile = pickedImage;
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
        setState(() {});
        getRecognizedText(pickedImage);
      }
    } catch (e) {
      isScanning = false;
      imageFile = null;
      setState(() {});
      CustomFunctions.showCustomSnackBar(
        context: context,
        content: e.toString(),
      );
    }
  }

  getRecognizedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer(
      script: widget.fromLangtext == 'Korean'
          ? TextRecognitionScript.korean
          : widget.fromLangtext == 'Japanese'
              ? TextRecognitionScript.japanese
              : TextRecognitionScript.latin,
    );

    RecognizedText recognizedText = await textDetector.processImage(inputImage);

    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        controller.text += "${line.text}\n";
      }
    }
    isScanning = false;
    isDone = true;
    if (isDone) {
      if (mounted) {
        Navigator.pop(context);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: CustomPopUpMenu(
                      text: widget.fromLangtext ?? 'English',
                      onChanged: (value) {
                        context.read<FromValueCubit>().changeFromValue(
                              fromLangText: value.country,
                              fromValue: value.language,
                            );
                        if (imageFile != null) {
                          getRecognizedText(XFile(imageFile!.path));
                        }
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (ctx) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                            decoration: const BoxDecoration(
                              color: Color(0XFFEAEAEA),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 5,
                                  width: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                const SizedBox(height: 34),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.camera);
                                      },
                                      child: Row(children: const [
                                        Icon(Icons.camera),
                                        SizedBox(width: 6),
                                        CustomText(
                                          'Camera',
                                          weight: FontWeight.w600,
                                        )
                                      ]),
                                    ),
                                    const SizedBox(height: 24),
                                    GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.photo_library),
                                          SizedBox(width: 6),
                                          CustomText(
                                            'Gallery',
                                            weight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 245,
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          spreadRadius: -1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        if (imageFile != null)
                          Image.file(
                            File(imageFile!.path),
                          ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: imageFile == null
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: imageFile == null
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    CustomText(
                                      'Select Photo',
                                      color: imageFile == null
                                          ? Colors.black
                                          : Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: CustomPopUpMenu(
                  text: widget.toLangText ?? 'English',
                  onChanged: (value) {
                    context.read<ToValueCubit>().changeToValue(
                          toLangText: value.country,
                          toValue: value.language,
                        );
                  },
                ),
              ),
            ),
            CustomTextField(
              controller: controller,
              hint: 'Translate text here',
              length: controller.text.length,
              onChanged: (value) {},
              button: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (widget.fromValue == 'fil') {
                        TranslatorService().translator(
                          text: controller.text,
                          from: 'fi',
                          to: widget.toValue ?? 'en',
                          onTranslated: (value) {
                            setState(() {
                              controller.text = value.text;
                            });
                          },
                        );
                      } else {
                        TranslatorService().translator(
                          text: controller.text,
                          from: widget.fromValue ?? 'en',
                          to: widget.toValue ?? 'en',
                          onTranslated: (value) {
                            setState(() {
                              controller.text = value.text;
                            });
                          },
                        );
                      }
                    },
                    icon: const Iconify(MaterialSymbols.g_translate),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (controller.text.isEmpty) {
                      } else {
                        Clipboard.setData(
                          ClipboardData(
                            text: controller.text,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

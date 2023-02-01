// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/presentation/bloc/navigate/navigate_cubit.dart';
import 'package:a_translator/presentation/screens/main/conversation.dart';
import 'package:a_translator/presentation/screens/main/image_translator.dart';
import 'package:a_translator/presentation/widgets/components/main_screen/gnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/translator/from_value/from_value_cubit.dart';
import '../bloc/translator/to_value/to_value_cubit.dart';
import '../widgets/components/main_screen/drawer.dart';
import 'main/text_translator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final navigate =
            context.select((NavigateCubit bloc) => bloc.state.index);
        final fromLangText =
            context.select((FromValueCubit bloc) => bloc.state.fromLangText);
        final fromValue =
            context.select((FromValueCubit bloc) => bloc.state.fromValue);
        final toLangText =
            context.select((ToValueCubit bloc) => bloc.state.toLangText);
        final toValue =
            context.select((ToValueCubit bloc) => bloc.state.toValue);
        List screens = [
          TextTranslatorScreen(
            fromLangtext: fromLangText,
            fromValue: fromValue,
            toLangText: toLangText,
            toValue: toValue,
          ),
          ConversationScreen(
            fromLangtext: fromLangText,
            fromValue: fromValue,
            toLangText: toLangText,
            toValue: toValue,
          ),
          ImageTranslatorScreen(
            fromLangtext: fromLangText,
            fromValue: fromValue,
            toLangText: toLangText,
            toValue: toValue,
          ),
        ];
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: screens[navigate],
          appBar: AppBar(),
          endDrawer: const CustomDrawer(),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomGnav(),
          ),
        );
      },
    );
  }
}

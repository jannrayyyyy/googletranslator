import 'package:a_translator/core/theme/data.dart';
import 'package:a_translator/data/models/history/history_model.dart';
import 'package:a_translator/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:a_translator/presentation/bloc/navigate/navigate_cubit.dart';
import 'package:a_translator/presentation/bloc/translator/from_value/from_value_cubit.dart';
import 'package:a_translator/presentation/bloc/translator/to_value/to_value_cubit.dart';

import 'package:a_translator/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'data/models/favorite/favorite_model.dart';
import 'dependency_injection.dart';

SharedPreferences? globalSharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(FavoriteModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());
  globalSharedPref = await SharedPreferences.getInstance();
  await Hive.openBox('favorite');
  await Hive.openBox('history');
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.theme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FromValueCubit(),
          ),
          BlocProvider(
            create: (context) => ToValueCubit(),
          ),
          BlocProvider(
            create: (context) => NavigateCubit(),
          ),
          BlocProvider(
            create: (context) => sl<FavoriteBloc>(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}

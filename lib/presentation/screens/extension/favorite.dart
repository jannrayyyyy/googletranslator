import 'package:a_translator/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/customs/text.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Favorite'),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state is LoadingSuccessful) {
            context.read<FavoriteBloc>().add(FetchValueEvent());
          }
        },
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const CircularProgressIndicator();
          } else if (state is FavoriteLoaded) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              padding: const EdgeInsets.all(6),
              child: SingleChildScrollView(
                child: Column(
                    children: state.favorite.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            '${e.fromValue} to ${e.toValue}',
                            weight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('id: ${e.id}');
                              context
                                  .read<FavoriteBloc>()
                                  .add(DeleteValueEvent(id: e.id));
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6),
                      CustomText(
                        e.rawText,
                        size: 11,
                      ),
                      const SizedBox(height: 6),
                      CustomText(
                        e.translatedText,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                }).toList()),
              ),
            );
          } else if (state is FavoriteEmpty) {
            return const Center(
                child: CustomText(
              'Nothing to see here..',
              weight: FontWeight.w600,
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

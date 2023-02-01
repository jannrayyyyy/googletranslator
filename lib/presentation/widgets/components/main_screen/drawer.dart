import 'package:a_translator/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:a_translator/presentation/screens/extension/favorite.dart';
import 'package:a_translator/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 42),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
            child: CustomText('LOGO'),
          ),
          const SizedBox(height: 42),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (ctx) => const HistoryScreen()));
          //   },
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          //     padding: const EdgeInsets.all(6),
          //     height: 43,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(16),
          //         boxShadow: const [
          //           BoxShadow(
          //             offset: Offset(0, 2),
          //             spreadRadius: -1,
          //             blurRadius: 2,
          //           ),
          //         ]),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: const [
          //         CustomText('History'),
          //         Icon(Icons.history),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => BlocProvider(
                    create: (context) =>
                        sl<FavoriteBloc>()..add(FetchValueEvent()),
                    child: const FavoriteScreen(),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              padding: const EdgeInsets.all(6),
              height: 43,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: -1,
                      blurRadius: 2,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                    'Favorite',
                    weight: FontWeight.w600,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

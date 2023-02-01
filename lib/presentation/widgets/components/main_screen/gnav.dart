import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../bloc/navigate/navigate_cubit.dart';

class CustomGnav extends StatelessWidget {
  const CustomGnav({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      haptic: true,
      rippleColor: Colors.grey[300]!,
      hoverColor: Colors.grey[100]!,
      gap: 3,
      activeColor: Colors.white,
      iconSize: 20,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: const Duration(milliseconds: 400),
      tabBackgroundColor: Colors.black,
      color: Colors.black,
      onTabChange: (value) {
        context.read<NavigateCubit>().navigateScreen(index: value);
      },
      tabs: const [
        GButton(
          icon: Icons.translate,
          text: 'Translate',
        ),
        GButton(
          icon: Icons.group,
          text: 'Conversation',
        ),
        GButton(
          icon: Icons.image,
          text: 'Image',
        ),
      ],
    );
  }
}

import 'package:a_translator/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('History'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CustomText(
                'clear history',
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  'Korean to English',
                  weight: FontWeight.w600,
                ),
                CustomText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis aliquam lacus, sed elementum lectus. Vestibulum tristique consectetur sapien, sit amet consectetur tellus dapibus in. Morbi mauris urna, blandit sollicitudin libero id, sollicitudin laoreet dui. Donec elit justo, finibus ac odio eu, dapibus elementum lacus.',
                  size: 11,
                ),
                SizedBox(height: 6),
                CustomText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis aliquam lacus, sed elementum lectus. Vestibulum tristique consectetur sapien, sit amet consectetur tellus dapibus in. Morbi mauris urna, blandit sollicitudin libero id, sollicitudin laoreet dui. Donec elit justo, finibus ac odio eu, dapibus elementum lacus.',
                  weight: FontWeight.w600,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

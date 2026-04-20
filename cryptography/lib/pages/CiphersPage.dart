import 'package:Cipherium/Widget/gridWidget.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:Cipherium/models/CardModel.dart';
import 'package:flutter/material.dart';

class CipherPage extends StatelessWidget {
  const CipherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: cardModel.Card.length,
          itemBuilder: (context, index) {
            final card = cardModel.Card[index];
            return gridWidget(
              image: card.image,
              title: card.title,
              page: card.page,
            );
          },
        ),
      ),
    );
  }
}

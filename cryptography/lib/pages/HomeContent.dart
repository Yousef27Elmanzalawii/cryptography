import 'package:Cipherium/Widget/cardWidget.dart';
import 'package:Cipherium/models/CardModel.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardModel.Card.length,
      itemBuilder: (context, index) {
        final card = cardModel.Card[index];
        return CardWidget(
          image: card.image,
          title: card.title,
          page: card.page,
        );
      },
    );
  }
}

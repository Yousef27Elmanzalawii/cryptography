import 'package:Cipherium/Widget/cardWidget.dart';
import 'package:Cipherium/Widget/sliderWidget.dart';
import 'package:Cipherium/models/CardModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 170,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: CarouselSlider.builder(
              itemCount: cardModel.Card.length,
              itemBuilder: (context, index, realIndex) {
                final card = cardModel.Card[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: sliderWidget(
                    image: card.image,
                    title: card.title,
                    page: card.page,
                  ),
                );
              },
              options: CarouselOptions(height: 170, autoPlay: true),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final card = cardModel.Card[index];
            return CardWidget(
              image: card.image,
              title: card.title,
              page: card.page,
            );
          }, childCount: cardModel.Card.length),
        ),
      ],
    );
  }
}

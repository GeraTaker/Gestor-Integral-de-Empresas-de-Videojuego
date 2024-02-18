import 'package:flutter/material.dart';

class ImageGames {
  ImageGames(
    this.image,
    this.color,
  );
  final String image;
  final Color color;
}

class Games {
  Games(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.listImage,
  );
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageGames> listImage;
}

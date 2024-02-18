import 'package:flutter/material.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/models/games.dart';


final listCompany = ['Xbox', 'Play', 'Nintento'];


final listGames = [
  Games(
    'Game pass',
    'Xbox',
    '\$249.00',
    4,
    [
      ImageGames(
        'img/gearsofwar2.jpg',
        const Color(0xff08B894),
      ),
      ImageGames(
        'img/ark.png',
        const Color(0xff08B896),
      ),
      ImageGames(
        'img/resident_evil_2.jpg',
        const Color(0xffB50D0D),
      ),
      ImageGames(
        'img/call-of-duty-black-ops-2.jpg',
        const Color(0xff229954),
      ),
    ],
  ),
  Games(
    'Spartacus',
    'Play',
    '\$279.00',
    3,
    [
      ImageGames(
        'img/godofwar.jpg',
        const Color.fromARGB(255, 57, 79, 176),
      ),
      ImageGames(
        'img/residen8Paly.jpg',
        const Color(0xffE90311),
      ),
      ImageGames(
        'img/spidermanPlay.jpg',
        const Color(0xff189E03),
      ),
      ImageGames(
        'img/thealstopfusplay.jpg',
        const Color(0xffF76A02),
      ),
    ],
  ),
  Games(
    'Nintend pass',
    'Nintento',
    '\$150.00',
    4,
    [
      ImageGames(
        'img/mario.jpg',
        const Color(0xffB50D0D),
      ),
      ImageGames(
        'img/amongnintento.jpg',
        const Color(0xff2C2C46),
      ),
      ImageGames(
        'img/arknintento.jpg',
        const Color(0xff262626),
      ),
      ImageGames(
        'img/zeldanintento.jpg',
        const Color(0xff5C9462),
      ),
    ],
  ),
];



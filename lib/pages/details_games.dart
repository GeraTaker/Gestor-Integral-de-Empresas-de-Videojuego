import 'package:flutter/material.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/models/games.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/widgets/widger_transition.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/widgets/widget_button.dart';

class DetailsGames extends StatefulWidget {
  //Constructor
  const DetailsGames({Key? key, required this.games}) : super(key: key);

  final Games games;

  @override
  State<DetailsGames> createState() => _DetailsGamesState();
}

class _DetailsGamesState extends State<DetailsGames> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double sizegames(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -size.height * 0.15,
              right: -size.height * 0.20,
              child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, __) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: value * (size.height * 0.5),
                      width: value * (size.height * 0.5),
                      decoration: BoxDecoration(
                        color: widget.games.listImage[valueIndexColor].color,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
            ),
            Positioned(
              top: kToolbarHeight,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetButton(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                    
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.games_outlined),
                      ),
                       IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.family_restroom_rounded),
                      ),
                       IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.desktop_mac_rounded),
                      )
                    ],
                  )
                ],
              ),
            ),

            ///Inicia nombre de la categoria
            Positioned(
              top: size.height * 0.20,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: FittedBox(
                  child: Text(
                    widget.games.category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ),
            ),

            ///Fin nombre de la categoria
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: size.height * 0.22,
              right: sizegames(valueIndexSize, size),
              left: sizegames(valueIndexSize, size),
              child: Hero(
                tag: widget.games.name,
                child: Image(
                  image: AssetImage(
                    widget.games.listImage[valueIndexColor].image,
                  ),
                ),
              ),
            ),

            ///Inicia juegos y tamaño
            Positioned(
              top: size.height * 0.6,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  //Inica datos generales
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: WidgetTransition(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.games.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.games.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      WidgetTransition(
                        left: false,
                        child: Text(
                          widget.games.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Fin datos generales

                  ///Inicia catalogo de juegos
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Juegos',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                widget.games.listImage.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    valueIndexColor = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color:
                                          widget.games.listImage[index].color,
                                      border: index == valueIndexColor
                                          ? Border.all(
                                              color: const Color.fromARGB(
                                                  255, 240, 246, 128),
                                              width: 2)
                                          : null,
                                    ),

                                    ///Se agrega la caratula de la imagen
                                    child: Image(
                                      image: AssetImage(
                                          widget.games.listImage[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      WidgetTransition(
                        left: false,
                        child: WidgetButton(
                          onTap: () {},
                          width: 50,
                          color: widget.games.listImage[valueIndexColor].color,
                          borderRadius: BorderRadius.circular(9.0),
                          child: const Icon(
                            Icons.email,
                            size: 20,
                          ),
                          // child: const Text(
                          //   'Request',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,

                          //   ),

                          // ),
                        ),
                      )
                    ],
                  ),

                  ///Fin catalogo de juegos

                  ///Inicia Catalogo de tamaños
                  const SizedBox(height: 4),
                  WidgetTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: widget.games.punctuation > index
                                  ? widget
                                      .games.listImage[valueIndexColor].color
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ver Caratula',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: WidgetButton(
                                onTap: () {
                                  valueIndexSize = index;
                                  setState(() {});
                                },
                                color: index == valueIndexSize
                                    ? widget
                                        .games.listImage[valueIndexColor].color
                                    : Colors.white,
                                child: Text(
                                  'Zoom ${index + 7}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Fin Catalogo de tamaños
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

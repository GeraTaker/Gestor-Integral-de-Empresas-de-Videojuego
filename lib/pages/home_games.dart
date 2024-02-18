import 'package:flutter/material.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/models/data.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/pages/details_games.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/widgets/widget_app_bar.dart';
import 'package:tarea1_challenge_tennis_version_videojuegos/widgets/widget_footer_bar.dart';

class HomeGames extends StatefulWidget {
  //Constructor
  const HomeGames({Key? key}) : super(key: key);

  @override
  State<HomeGames> createState() => _HomeGamesState();
}

class _HomeGamesState extends State<HomeGames> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  final  iconsCompany = [
    'img/xbox.png',
    'img/play.png',
    'img/nintento.png',
  ];

  Color getColor() {
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listGames[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listGames[1].listImage[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listGames[2].listImage[0].color;
    }
    return color;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold se utiliza como un contenedor
    return Scaffold(
      body: Column(
        children: [
          /// Inicia Menu arriba
          const WidgetAppBar(),

          /// Fin Menu arriba

          ///Inicia lista de categorias
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                  listCompany.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      listCompany[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,

                        ///Cambia el tamaño y el color de acrudo al index si no esta se queda como fijo
                        fontSize: index == indexPage ? 25 : 15,
                        color: index == indexPage ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ///Termina Lista de Categorias

          ///

          /// Inica Body
          Expanded(
              child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listGames.length,
            controller: _pageController,
            itemBuilder: ((context, index) {
              //Accede a cada juego por el indice

              final games = listGames[index];
              final listTitle = games.category.split('');
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, _) {
                        return DetailsGames(games: games);
                      },
                    ),
                  );
                },
                child: Padding(
                  ///Cambia el tamaño  de acrudo al index si no esta se queda como fijo
                  padding: EdgeInsets.only(right: index == indexPage ? 30 : 60),
                  child: Transform.translate(
                    offset: Offset(index == indexPage ? 0 : 20, 0),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: EdgeInsets.only(
                          ///Cambia el tamaño  de acrudo al index si no esta se queda como fijo
                          top: index == indexPage ? 30 : 60,
                          bottom: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.white,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 40),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      games.category,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),

                                    ///Inicia nombre icono y prcio
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                  
                                        Text(
                                          games.name,
                                          style:  TextStyle(
                                              color: index == indexPage ? getColor() : Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),

                               
                                        Image.asset(iconsCompany[index], width: 30, height: 30),
                                        ///Inicia Precio
                                        
                                        Text(
                                          games.price,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600),
                                        )

                                        ///Termina Precio
                                      ],
                                    )

                                    ///Termina nombre
                                  ]),
                            ),

                            ///Inicia Imagen
                            Positioned(
                              top: constraints.maxHeight * 0.2,
                              left: constraints.maxWidth * 0.05,
                              right: -constraints.maxWidth * 0.01,
                              bottom: constraints.maxHeight * 0.2,
                              child: Hero(
                                tag: games.name,
                                child: Image(
                                  image: AssetImage(
                                    games.listImage[0].image,
                                  ),
                                ),
                              ),
                            ),

                            ///Termina Imagen

                            ///Iniica botton
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                color: games.listImage[0].color,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {},
                                  child: const SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            )

                            ///Termina botton
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              );
            }),
          )),

          ///Termina body

          ///Inifia foooter
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: WidgetFooterBar(color: getColor()),
          )

          ///Temrina Footer
        ],
      ),
    );
  }
}

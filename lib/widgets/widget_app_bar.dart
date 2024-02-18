import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///SizedBox define el tamaño
    return SizedBox(
      //kToolbarHeight constante de tamaño de iconos de barra
      height: kToolbarHeight + 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          //Manera de aliniar a los hijos
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Primer hijo iconos de compañias
            Row(
              children: [
                Image.asset('img/xbox.png', width: 30, height: 30),
                Image.asset('img/play.png', width: 30, height: 30),
                Image.asset('img/nintento.png', width: 30, height: 30),
              ],
            ),
            //Segundo hijo
            Row(
              children: [
                Text('Service games',style: TextStyle(fontSize: 16,color: Colors.cyan[200]))
                
              ],
            ),
            //tercer hijo iconos de la practica 
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

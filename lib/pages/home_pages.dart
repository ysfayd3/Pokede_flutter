import 'package:flutter/material.dart';

import 'package:podekso_app/widgets/app_title.dart';
import 'package:podekso_app/widgets/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OrientationBuilder(//orientatıon ıcıne  almamızın sebebı her seferınde degısıklıgı algılasın dıye 
        builder: (context, orientation) => Column(
          children: const [
            AppTitle(),
            PokemonList(),
           
          ],
        ),
      ),
    );
  }
}

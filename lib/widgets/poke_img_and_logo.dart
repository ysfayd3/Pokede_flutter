import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:podekso_app/constant/ui_helper.dart';
import 'package:podekso_app/model/pokemon_model.dart';

class PokeImgAndLogo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndLogo({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
     String pokebollLogoUrl = 'images/abc.png';
  
    return Stack(
      children: [
       Align(//logo ve fotoyu hızlamak ıcın kullandık
          alignment: Alignment.bottomRight,//logoyu sag altta yokladık  burada
        
         child: Image.asset(
          pokebollLogoUrl,
          width: UIHelper.calculatePokeImgAndLogoSize(),
          height: UIHelper.calculatePokeImgAndLogoSize(),
       
          fit: BoxFit.fitHeight,
          
          
          ),
       ),//logoyu koyduk
       Align(
        alignment: Alignment.bottomRight,//yukarıda yapılan ıslemın aynısı yapıldı fotografta sag alt tarfa gonderıldı
         child: Hero(
          tag: pokemon.id!,
           child: CachedNetworkImage(
            imageUrl: pokemon.img ?? '', 
            errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
           
           width: UIHelper.calculatePokeImgAndLogoSize(),
            height: UIHelper.calculatePokeImgAndLogoSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>  CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemon.type![0]),
              ),//verı gelene kadar orada ufak bır anımasyon gosterılır
              //placeholder yertutucu manasına gelır 
            
            ),
         ),
       ),//pokemon img zorunlu olarak verd dedık sonra bossa '' koy dedık
      ],


    );
  }
}

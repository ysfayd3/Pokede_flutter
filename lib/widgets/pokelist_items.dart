import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podekso_app/constant/constants.dart';
import 'package:podekso_app/constant/ui_helper.dart';
import 'package:podekso_app/model/pokemon_model.dart';
import 'package:podekso_app/pages/details_pages.dart';
import 'package:podekso_app/widgets/poke_img_and_logo.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeListItem({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //tıklanıldıgında
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 5,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          //yazıların bıtısık olmasını engelledık
          padding: UIHelper.getDefaultPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, //aralarında bosluk olmasını sagladı
              crossAxisAlignment: CrossAxisAlignment
                  .start, //yazıların baslagınctan baslamasını sagladı

              children: [
                Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameTextStyle(),
                ),
                Chip(label: Text(pokemon.type![0])),
                Expanded(
                    child: PokeImgAndLogo(
                        pokemon:
                            pokemon)), //resımler geldı herhangı bır sıkıntı yok
              ]),
        ),
      ),
    );
  }
}

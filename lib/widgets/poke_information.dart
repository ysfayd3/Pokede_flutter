
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podekso_app/constant/constants.dart';
import 'package:podekso_app/constant/ui_helper.dart';


import '../model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({super.key, required this.pokemon});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name:', pokemon.name),
            _buildInformationRow('Height:', pokemon.height),
            _buildInformationRow('Weight:', pokemon.weight),
            _buildInformationRow('Spawn Time:', pokemon.spawnTime),
            _buildInformationRow('Spawn Time:', pokemon.spawnTime),
            _buildInformationRow('Weakness:', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution:', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution:', pokemon.nextEvolution),

          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(label,style: Constants.getPokeInfoLabelTextStyle(),),//eger
        if(value is List && value.isNotEmpty)
          Text(value.join(' , '),style: Constants.getPokeInfoTextStyle(),)
        else if(value == null)
          Text('Not available  ',style: Constants.getPokeInfoTextStyle(),)
         else Text(value,style: Constants.getPokeInfoTextStyle(),),

      ],
    );
  }
}

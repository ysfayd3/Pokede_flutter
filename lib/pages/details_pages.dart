import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:podekso_app/constant/ui_helper.dart';

import 'package:podekso_app/model/pokemon_model.dart';

import '../widgets/poke_information.dart';
import '../widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  static String pokebollLogoUrl = 'images/abc.png';
  final PokemonModel pokemon; //ilgili verileri kullanmak için bunu çagırıyoruz

  const DetailPage({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitMode(context)
        : _builLansScapedMode(context);
  }

  Scaffold _builLansScapedMode(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 20.w,
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    // builder: (context) => HomePage(),
                    // ));
      
                    //alternatıf olarak bunu dayapabılırsın
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          Expanded(child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,//arayı acıyor   
                  children: [ 
              
                    PokeTypeName(pokemon: pokemon),
              
                    Expanded(
                      child: Hero( 
                          tag: pokemon.id ?? '',
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            fit: BoxFit.contain,
                            height: 0.20.sw   ,//genıslıge gore buyut dedık
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: UIHelper.getDefaultPadding(),
                  child: PokeInformation(pokemon: pokemon),
                )), 
            ],
            ),
            ),
          ]),
      ),

    );
  }

  Scaffold _buildPortraitMode(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        //üzerine widget gelmez ve appbarın ordakı çizgiden bızı kurtarır
        //iconların hemen altında uyglamamız baslar

        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
                iconSize: 24.w,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  // builder: (context) => HomePage(),
                  // ));

                  //alternatıf olarak bunu dayapabılırsın
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ), //geri gitme tusu en sol üstteki,
          PokeTypeName(
              pokemon:
                  pokemon), //bunu yazddıktan sonra verıler gozukmeye basladı
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    pokebollLogoUrl,
                    fit: BoxFit.contain,
                    height: 0.15.sh,
                  ),
                ),

                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12
                        .sh, //artırdıkca asagıya ıner azaltıkca yukarı cıkar
                    child: PokeInformation(pokemon: pokemon)),
                //align ıle yaptık cuku posınetde yaptgımızda hata aldık o yuzden alıgn ıle yaptık
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id ?? '',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      fit: BoxFit.contain,
                      height: 0.20.sh,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:podekso_app/model/pokemon_model.dart';

class PokeApi {
  // ignore: unused_field
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
//statıc yapıyorum cunku herhangı bır nesne uretmeden dırekt erısmek ıstıyorum

  static Future<List<PokemonModel>> getPokemonData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    //normalde dıo da decode etmeye gerek yoktu ama urlmız json ıle bıttıgı yanı text olarak okudugu ıcın onu decod etmemız gerek

    var pokemonList = jsonDecode(result.data)['pokemon'];
    //debugPrint(pokemonList['pokemon'].toString());//pokemen oldugu ıcın pokemondan sonra oraya oyle yazdık

    if (pokemonList is List) {
      _list = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }
    //debugPrint(_list.first.toString());

    return _list;
  }
}

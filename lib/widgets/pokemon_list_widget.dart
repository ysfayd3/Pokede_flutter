import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podekso_app/widgets/pokelist_items.dart';

import '../model/pokemon_model.dart';
import '../servers/podex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: no_leading_underscores_for_local_identifiers
          List<PokemonModel> _listem =
              snapshot.data!; //burada cektıgımız verı ,verının kendısı

          return Expanded(///lıstvıew ıcın yukseklık belırmedıgımız ıcın expanded ıcıne almazsak hata verir
            child: GridView.builder(
              itemCount: _listem.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2:3),
              itemBuilder:(context, index) => PokeListItem(pokemon: _listem[index]),),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata cıktı "),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
/* Expanded(//lıstvıew ıcın yukseklık belırmedıgımız ıcın expanded ıcıne almazsak hata verir
            child: ListView.builder(
              itemCount: _listem.length,
              itemBuilder: (context, index) {
                var oankiPokemon = _listem[index];
                return PokeListItem(pokemon:oankiPokemon);
              },
            ),
          ); */
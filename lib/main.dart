import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podekso_app/pages/home_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // PokeApi.getPokemonData();
    // ignore: prefer_const_constructors
    return ScreenUtilInit(
      designSize: const Size(450, 800),
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex ',
        theme: ThemeData.dark(),
        home:  const HomePage(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); //consturucturu gızlı yaptık

  static const String title = "Pokedex";
  // ignore: non_constant_identifier_names
  static TextStyle TitleStlye() {
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(40),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17 ,
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
  }

  static String pokebollLogoUrl = 'images/abc.png';

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {//ekran dıkey moddaysa ekranı eger yazı bouyutu degısmısse ona uyum saglar
      return size
          .sp; //ekranda kı yazı boyutunun ayarlamasını saglar.adam mesala yazı bouyutunu buyuttu bızım degerımız 48. bızım 48 aynı oranda buyuyor ama degerı degısmıyor
    } else {
      return (size * 1.5).sp;
    }
  }

  static getPokeInfoTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
  }

  
  static getPokeInfoLabelTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold
    );
  }
}

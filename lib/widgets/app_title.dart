import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podekso_app/constant/constants.dart';
import 'package:podekso_app/constant/ui_helper.dart';


class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: UIHelper.getApptitleWidgetHeight(),
      
     // width: 200,
     // height: 100,
      child: Stack(
        children: [
             Padding(
               padding: UIHelper.getDefaultPadding(),
               child: Align(
            alignment: Alignment.centerLeft,
               child: Text(Constants.title,style: Constants.TitleStlye(),)),
             ),
    
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              Constants.pokebollLogoUrl,
              width:  ScreenUtil().orientation==Orientation.portrait ? 0.2.sh:0.2.sw,
             
              fit: BoxFit.fitWidth,
              ),
              ),
        ],
      ),
    );
  }
}

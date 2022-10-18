

import 'package:flutter/material.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';

 class SnInputDecotration{

    String hintText;
    IconData icon;
    SnInputDecotration({
      required this.hintText,
      required this.icon,
    
    });




    InputDecoration normalForms(){
       return InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(color: SnColors.whatsappColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
            borderSide: BorderSide(color: SnColors.whatsappColor),
          ),
          filled: true,
          prefixIcon: Icon(icon),
          fillColor: SnColors.lightScaffoldBackgraoundColor);
    }



    InputDecoration searchForms(){
       return InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(color: SnColors.whatsappColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
            borderSide: BorderSide(color: SnColors.whatsappColor),
          ),
          filled: true,
          prefixIcon: Icon(icon),
          fillColor: SnColors.lightScaffoldBackgraoundColor);
    }



}
import 'package:flutter/material.dart';

Widget normaltext({
  String? text, Color? color, double?size,
}){
  return Text(
    '${text}',
    style: TextStyle(fontFamily: 'Poppins', fontSize: size, color: color),

  );
}

Widget headingtext1({
  String? text, Color? color, double?size,
}){
  return Text(
    '${text}',
    style: TextStyle(fontFamily: 'Poppins_bold', fontSize: size, color: color),

  );
}
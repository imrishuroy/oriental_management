import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Blue', percent: 40, color: const Color(0xff845bef)),
    Data(name: 'Orange', percent: 30, color: const Color(0xff0293ee)),
    Data(name: 'Black', percent: 15, color: Colors.red[200]),
    Data(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String? name;

  final double? percent;

  final Color? color;

  Data({this.name, this.percent, this.color});
}
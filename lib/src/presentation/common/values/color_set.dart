import 'package:flutter/material.dart';

enum ColorSet {
  blackGradient30(Color(0x30000000)),
  blackGradient60(Color(0x60000000)),
  blackGradient87(Color(0x87000000)),
  blackGradient90(Color(0x90000000)),
  blackOpacity(Color(0xB1000000)),
  blackOpacity01(Color(0x17000000)),
  blackOpacity04(Color(0x66000000)),
  white(Color(0xFFFFFFFF)),
  whiteGradient80(Color(0x80FFFFFF)),
  whiteGradient50(Color(0x50FFFFFF)),
  whiteGradient30(Color(0x30FFFFFF)),
  greyOpacity(Color(0xFFFAFAFA)),
  blueOpacity(Color(0x661976D2)),
  blueGradient19(Color(0xFF1976D2)),
  blueGradient99(Color(0xFF99B6D3)),
  redAccent(Color(0xFFFF0202)),
  green(Color(0xFF4ecd16)),
  mediumSeaGreen(Color(0xFF0EA54A)),
  grey(Color(0xFFE0E0E0)),
  lightBlue(Color(0x6100A9B5)),
  lightPurple(Color(0x9C78759D));

  const ColorSet(this.value);

  final Color value;
}

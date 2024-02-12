import 'package:flutter/material.dart';

import 'bennerPagView.dart';

final List<Widget> pages = [
  benner(
    "Flash Offer",
    "We are here with the best\ndeserts intown.",
    "Order >",
    "assets/logo1.png",
    "assets/burgers.png",
    LinearGradient(
      colors: [Color(0xffFF9F06), Color(0xffFFE1B4)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  benner(
    "Flash Offer",
    "We are here with the best\ndeserts intown.",
    "Order >",
    "assets/logo2.png",
    "assets/Pizza1.png",
    LinearGradient(
      colors: [Color(0xFF060AFF), Color(0xFFB4C8FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  benner(
    "Flash Offer",
    "We are here with the best\ndeserts intown.",
    "Order >",
    "assets/logo1.png",
    "assets/burgers.png",
    LinearGradient(
      colors: [Color(0xFF06FF30), Color(0xFFB4FFD3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
];
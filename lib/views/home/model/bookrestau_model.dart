import 'package:flutter/material.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:get/get.dart';

class BookRestauModel {
  final String image;
  final String restauName;
  final String location;
  BookRestauModel(this.image, this.restauName, this.location,);
}

List<BookRestauModel> BookRestauDataList = [
  BookRestauModel("assets/shop1.png", "Hotel Zaman Restaurant",
      "kazi Deiry, Taiger Pass\nChittagong"),
  BookRestauModel("assets/shop2.png", "Tava Restaurant",
      "Zakir Hossain Rd,\nChittagong", ),
  BookRestauModel("assets/shop1.png", "Hotel Zaman Restaurant",
      "kazi Deiry, Taiger Pass\nChittagong",),
  BookRestauModel("assets/shop2.png", "Tava Restaurant",
      "Zakir Hossain Rd,\nChittagong", ),
  BookRestauModel("assets/shop1.png", "Hotel Zaman Restaurant",
      "kazi Deiry, Taiger Pass\nChittagong",),
  BookRestauModel("assets/shop2.png", "Tava Restaurant",
      "Zakir Hossain Rd,\nChittagong",),
];

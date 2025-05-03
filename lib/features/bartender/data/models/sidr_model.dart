import 'package:flutter/material.dart';

class SidrModel {
  final int id;
  bool active;
  bool lose;
  bool won;
  int bet;
  VoidCallback? fill;

  SidrModel({
    required this.id,
    this.active = false,
    this.fill,
    this.lose = false,
    this.won = false,
    this.bet = 0,
  });
}

import 'package:crazy_granny/features/aim_shoot/aim_shoot.dart';
import 'package:flutter/material.dart';

class TargetModel {
  final HighlightedItem item;
  VoidCallback? explode;

  TargetModel({required this.item, this.explode});
}

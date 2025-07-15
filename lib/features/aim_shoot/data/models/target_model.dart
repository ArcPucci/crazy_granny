import 'package:crazy_granny/features/aim_shoot/aim_shoot.dart';
import 'package:flutter/material.dart';

class TargetModel {
  final GlobalKey key;
  final HighlightedItem item;
  VoidCallback? explode;

  TargetModel({GlobalKey? key, required this.item, this.explode})
      : key = key ?? GlobalKey();
}

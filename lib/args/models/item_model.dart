import 'package:flutter/material.dart';

class ItemModel {
  late String? name;
  late Color? color;
  late bool? isSelected;
  late double? value;
  late bool? isDisponible;

  ItemModel(
    this.name,
    this.color,
    this.isSelected,
    this.value,
    this.isDisponible,
  );
}

import 'package:flutter/material.dart';

class ItemModel {
  late String? name;
  late Color? color;
  late bool? isSelected;
  late double? value;

  ItemModel(
    this.name,
    this.color,
    this.isSelected,
    this.value,
  );
}

import 'dart:convert';

import 'package:flutter/material.dart';

class ItemModel {
  late int? id;
  late String? name;
  late Color? color;
  late bool? isSelected;
  late double? value;
  late bool? isAvailable;

  ItemModel(
    this.id,
    this.name,
    this.color,
    this.isSelected,
    this.value,
    this.isAvailable,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color?.value,
      'isSelected': isSelected,
      'value': value,
      'isDisponible': isAvailable,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      map['id'],
      map['name'],
      map['color'] != null ? Color(map['color']) : null,
      map['isSelected'],
      map['value']?.toDouble(),
      map['isDisponible'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}

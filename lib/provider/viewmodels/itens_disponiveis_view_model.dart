import 'package:flutter/material.dart';
import 'package:provider_state_management/provider/models/item_model.dart';

class ItensDisponiveisViewModel extends ChangeNotifier {
  final List<ItemModel?> _itensListModel = <ItemModel>[
    ItemModel(0, "Macarrão", Colors.orange, false, 10, true),
    ItemModel(1, "Queijo", Colors.yellow, false, 3, true),
    ItemModel(2, "Molho de tomate", Colors.red, false, 2, true),
    ItemModel(3, "Molho branco", Colors.grey, false, 3, true),
    ItemModel(4, "Bacon", Colors.red.shade400, false, 5, true),
    ItemModel(5, "Coca-Cola 2L", Colors.black54, false, 15, true),
    ItemModel(6, "Cookie de Chocolate", Colors.brown.shade400, false, 3, true),
  ];

  List<ItemModel?> get itensListModel =>
      _itensListModel.where((item) => item!.isAvailable!).toList();

  void removeItens(List<ItemModel?> listItens) {
    for (var itemDisponivel in _itensListModel) {
      for (var item in listItens) {
        if (itemDisponivel!.id == item!.id) {
          itemDisponivel.isAvailable = false;
        }
      }
    }
    notifyListeners();
  }
}

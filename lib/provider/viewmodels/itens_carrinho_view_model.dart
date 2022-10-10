import 'package:flutter/material.dart';
import 'package:provider_state_management/provider/models/item_model.dart';

class ItensCarrinhoViewModel extends ChangeNotifier {
  final List<ItemModel?> _itensListModel = <ItemModel>[];
  late double? total = 0;

  List<ItemModel?> get itensListModel => _itensListModel;

  void removeItem(ItemModel? item) {
    item!.isSelected = false;
    item.isAvailable = true;
    _itensListModel.remove(item);
    notifyListeners();
  }

  void addItem(ItemModel? item) {
    item!.isSelected = true;
    item.isAvailable = false;
    _itensListModel.add(item);
    notifyListeners();
  }

  void updateTotal() {
    total = 0;
    for (var item in _itensListModel) {
      total = total! + item!.value!;
    }
    notifyListeners();
  }

  void buyListItens() {
    itensListModel.clear();
    notifyListeners();
  }
}

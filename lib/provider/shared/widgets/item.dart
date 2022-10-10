import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_state_management/args/shared/style/text_style.dart';
import 'package:provider_state_management/args/shared/widgets/card_item.dart';
import 'package:provider_state_management/provider/models/item_model.dart';
import 'package:provider_state_management/provider/viewmodels/itens_carrinho_view_model.dart';
import 'package:provider_state_management/provider/viewmodels/itens_disponiveis_view_model.dart';

class Item extends StatelessWidget {
  final ItemModel? item;
  final int? index;
  const Item({
    Key? key,
    this.item,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ItensDisponiveisViewModel, ItensCarrinhoViewModel>(
      builder:
          (context, itensDisponiveisViewModel, itensCarrinhoViewModel, child) {
        return CardItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: item!.color,
                width: 20,
                height: 20,
              ),
              Text(
                item!.name!,
                style: font14NormalBlack,
              ),
              Text(
                "R\$ ${item!.value!.toStringAsFixed(2)}",
                style: font14NormalBlack,
              ),
              item!.isSelected!
                  ? IconButton(
                      onPressed: () {
                        itensCarrinhoViewModel.removeItem(item);
                        itensCarrinhoViewModel.updateTotal();
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 30,
                        color: Colors.red,
                      ))
                  : IconButton(
                      onPressed: () {
                        itensCarrinhoViewModel.addItem(item);
                        itensCarrinhoViewModel.updateTotal();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

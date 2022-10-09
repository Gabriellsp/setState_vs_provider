import 'package:flutter/material.dart';

import 'package:provider_state_management/args/models/item_model.dart';
import 'package:provider_state_management/shared/style/text_style.dart';
import 'package:provider_state_management/shared/widgets/card_item.dart';

class Item extends StatelessWidget {
  final ItemModel? item;
  final Function? callbackFunction;
  const Item({
    Key? key,
    this.item,
    required this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    callbackFunction!(false, item);
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.red,
                  ))
              : IconButton(
                  onPressed: () {
                    callbackFunction!(true, item);
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
  }
}

import 'package:flutter/material.dart';
import 'package:provider_state_management/args/models/item_model.dart';

class Item extends StatefulWidget {
  final ItemModel? item;
  const Item({super.key, this.item});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.9,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              color: widget.item!.color,
              width: 20,
              height: 20,
            ),
            Text(widget.item!.name!),
            Text("R\$ ${widget.item!.value!.toStringAsFixed(2)}"),
            widget.item!.isSelected!
                ? IconButton(
                    onPressed: () => setState(() {
                          widget.item?.isSelected = false;
                        }),
                    icon: const Icon(Icons.remove))
                : IconButton(
                    onPressed: () => setState(() {
                          widget.item?.isSelected = true;
                        }),
                    icon: const Icon(Icons.add)),
          ]),
        ),
      ),
    );
  }
}

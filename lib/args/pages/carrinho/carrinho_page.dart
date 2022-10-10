import 'package:flutter/material.dart';

import 'package:provider_state_management/args/models/item_model.dart';
import 'package:provider_state_management/args/shared/widgets/no_items.dart';
import 'package:provider_state_management/args/shared/style/text_style.dart';
import 'package:provider_state_management/args/shared/widgets/item.dart';

class CarrinhoPage extends StatefulWidget {
  final List<ItemModel>? listItemSelected;
  const CarrinhoPage({
    super.key,
    required this.listItemSelected,
  });

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  late double? totalValue;
  @override
  void initState() {
    super.initState();

    totalValue = _getTotalValue();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Carrinho')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.listItemSelected!.isEmpty
            ? const NoItems(
                title: "Nenhum item adicionado ao carrinho ainda",
              )
            : Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Itens selecionados:",
                      style: font18BoldBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _listItensSelected(),
                  const SizedBox(
                    height: 24,
                  ),
                  _totalValue(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buyButton(
                    width: screenSize.width * 0.90,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _listItensSelected() => ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 120,
          maxHeight: 340,
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:
              widget.listItemSelected!.where((item) => item.isSelected!).length,
          itemBuilder: (BuildContext context, int index) {
            return Item(
                item: widget.listItemSelected!.elementAt(index),
                callbackFunction: _setSelectedItem);
          },
        ),
      );

  void _setSelectedItem(bool isSelected, ItemModel item) {
    setState(() {
      item.isSelected = isSelected;
      widget.listItemSelected!.remove(item);
      totalValue = _getTotalValue();
    });
  }

  double _getTotalValue() {
    double total = 0;
    for (var item in widget.listItemSelected!) {
      total = total + item.value!;
    }
    return total;
  }

  Widget _totalValue() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total: ",
            style: font18BoldBlack,
          ),
          Text(
            "R\$ ${totalValue!.toStringAsFixed(2)}",
            style: font18BoldBlueAccent,
          ),
        ],
      );

  Widget _buyButton({required double width}) => SizedBox(
        width: width,
        height: 40,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent),
            ),
            onPressed: () {
              for (var item in widget.listItemSelected!) {
                item.isAvailable = false;
                item.isSelected = false;
              }
              Navigator.of(context).pop();
            },
            child: const Text("Comprar")),
      );
}

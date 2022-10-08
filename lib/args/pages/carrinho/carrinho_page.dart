import 'package:flutter/material.dart';

import 'package:provider_state_management/args/models/item_model.dart';
import 'package:provider_state_management/args/pages/catalogo/widgets/item.dart';

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
  late double totalValue;

  @override
  void initState() {
    super.initState();
    totalValue = 0;
    _getTotalValue();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Carrinho')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Itens selecionados:",
              ),
            ),
            Container(
              height: screenSize.height * 0.45,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.8,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: ListView.builder(
                  itemCount: widget.listItemSelected!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Item(
                      item: widget.listItemSelected!.elementAt(index),
                    );
                  }),
            ),
            Text("R\$ ${totalValue.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }

  void _getTotalValue() {
    double x = 0;
    for (var item in widget.listItemSelected!) {
      x = x + item.value!;
    }
    setState(() {
      totalValue = x;
    });
  }
}

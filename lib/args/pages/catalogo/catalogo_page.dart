import 'package:flutter/material.dart';
import 'package:provider_state_management/args/models/item_model.dart';
import 'package:provider_state_management/shared/widgets/no_items.dart';
import 'package:provider_state_management/shared/widgets/item.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoState();
}

class _CatalogoState extends State<CatalogoPage> {
  List<ItemModel> itens = [
    ItemModel("Macarrão", Colors.orange, false, 10, true),
    ItemModel("Queijo", Colors.yellow, false, 3, true),
    ItemModel("Molho de tomate", Colors.red, false, 2, true),
    ItemModel("Molho branco", Colors.grey, false, 3, true),
    ItemModel("Bacon", Colors.red.shade400, false, 5, true),
    ItemModel("Coca-Cola 2L", Colors.black54, false, 15, true),
    ItemModel("Cookie de Chocolate", Colors.brown.shade400, false, 3, true),
  ];

  @override
  Widget build(BuildContext context) {
    var availableItems =
        itens.where((element) => element.isDisponible!).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Catálogo')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/carrinho', arguments: {
                'listItemSelected':
                    itens.where((item) => item.isSelected!).toList()
              }).then((_) => setState(
                  () {})); //TODO usado para ao retornar para a página ocorrer um refresh nos estados
            },
          )
        ],
      ),
      body: availableItems.isEmpty
          ? const NoItems(
              title: "Sem itens disponíveis no momento",
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: availableItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Item(
                      item: availableItems.elementAt(index),
                      callbackFunction: _setSelectedItem,
                    );
                  }),
            ),
    );
  }

  void _setSelectedItem(bool isSelected, ItemModel item) {
    setState(() {
      item.isSelected = isSelected;
    });
  }
}

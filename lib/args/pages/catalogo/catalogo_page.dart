import 'package:flutter/material.dart';
import 'package:provider_state_management/args/models/item_model.dart';
import 'package:provider_state_management/args/pages/catalogo/widgets/item.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoState();
}

class _CatalogoState extends State<CatalogoPage> {
  List<ItemModel> itens = [
    ItemModel("Macarrão", Colors.orange, false, 10),
    ItemModel("Queijo", Colors.yellow, false, 3),
    ItemModel("Molho de tomate", Colors.red, false, 2),
    ItemModel("Molho branco", Colors.grey, false, 3),
    ItemModel("Bacon", Colors.red.shade400, false, 5),
    ItemModel("Coca-Cola 2L", Colors.black54, false, 15),
    ItemModel("Cookie de Chocolate", Colors.brown.shade400, false, 3),
  ];
  @override
  Widget build(BuildContext context) {
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
              });
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (BuildContext context, int index) {
            return Item(
              item: itens.elementAt(index),
            );
          }),
    );
  }
}

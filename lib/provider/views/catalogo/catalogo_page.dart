import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/shared/constants/route_paths.dart';
import 'package:provider_state_management/provider/shared/widgets/item.dart';
import 'package:provider_state_management/provider/shared/widgets/no_items.dart';
import 'package:provider_state_management/provider/viewmodels/itens_disponiveis_view_model.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItensDisponiveisViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Catálogo')),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        RoutePaths
                            .Carrinho); //TODO usado para ao retornar para a página ocorrer um refresh nos estados
                  },
                ),
              )
            ],
          ),
          body: viewModel.itensListModel.isEmpty
              ? const NoItems(
                  title: "Sem itens disponíveis no momento",
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: viewModel.itensListModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Item(
                          item: viewModel.itensListModel.elementAt(index),
                          index: index,
                        );
                      }),
                ),
        );
      },
    );
  }
}

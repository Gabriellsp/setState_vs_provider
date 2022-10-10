import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/shared/style/text_style.dart';
import 'package:provider_state_management/provider/shared/widgets/item.dart';
import 'package:provider_state_management/provider/shared/widgets/no_items.dart';
import 'package:provider_state_management/provider/viewmodels/itens_carrinho_view_model.dart';
import 'package:provider_state_management/provider/viewmodels/itens_disponiveis_view_model.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({
    super.key,
  });

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ItensCarrinhoViewModel>(
      builder: (_, viewModel, __) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Carrinho')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: viewModel.itensListModel.isEmpty
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
      },
    );
  }

  Widget _listItensSelected() => Consumer<ItensCarrinhoViewModel>(
        builder: (context, viewModel, child) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 120,
              maxHeight: 340,
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: viewModel.itensListModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Item(
                  item: viewModel.itensListModel.elementAt(index),
                  // index: index,
                );
              },
            ),
          );
        },
      );

  Widget _totalValue() => Consumer<ItensCarrinhoViewModel>(
        builder: (context, viewModel, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total: ",
                style: font18BoldBlack,
              ),
              Text(
                "R\$ ${viewModel.total!.toStringAsFixed(2)}",
                style: font18BoldBlueAccent,
              ),
            ],
          );
        },
      );

  Widget _buyButton({required double width}) =>
      Consumer2<ItensDisponiveisViewModel, ItensCarrinhoViewModel>(
        builder:
            (context, itensDisponiveisViewModel, itensCarrinhoViewModel, __) {
          return SizedBox(
            width: width,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: () {
                  itensCarrinhoViewModel.buyListItens();
                  itensDisponiveisViewModel
                      .removeItens(itensCarrinhoViewModel.itensListModel);
                  Navigator.of(context).pop();
                },
                child: const Text("Comprar")),
          );
        },
      );
}

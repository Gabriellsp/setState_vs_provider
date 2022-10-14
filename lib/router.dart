import 'package:flutter/material.dart';

import 'package:provider_state_management/provider/shared/constants/route_paths.dart';
import 'package:provider_state_management/provider/views/carrinho/carrinho_page.dart';
import 'package:provider_state_management/provider/views/catalogo/catalogo_page.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Catalogo:
        return MaterialPageRoute(builder: (_) => const CatalogoPage());
      case RoutePaths.Carrinho:
        return MaterialPageRoute(builder: (_) => const CarrinhoPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

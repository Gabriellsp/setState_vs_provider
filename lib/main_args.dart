import 'package:flutter/material.dart';
import 'package:provider_state_management/args/pages/carrinho/carrinho_page.dart';
import 'package:provider_state_management/args/pages/catalogo/catalogo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Using Arguments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const CatalogoPage(),
        '/carrinho': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return CarrinhoPage(listItemSelected: args['listItemSelected']);
        },
      },
    );
  }
}

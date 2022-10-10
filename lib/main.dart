import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/viewmodels/itens_carrinho_view_model.dart';
import 'package:provider_state_management/provider/viewmodels/itens_disponiveis_view_model.dart';
import 'package:provider_state_management/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItensDisponiveisViewModel()),
        ChangeNotifierProvider(create: (_) => ItensCarrinhoViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State Management Using Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouterManager.generateRoute,
      ),
    );
  }
}

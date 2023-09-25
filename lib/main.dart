import 'package:flutter/material.dart';
import 'my_app.dart';
import 'provider/imc_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => IMCResultsProvider(),
      child: const MyApp(),
    ),
  );
}

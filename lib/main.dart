import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';
import 'provider/imc_provider.dart';
import 'repositories/sqlite/sqlitedatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SQLiteDataBase().initDataBase();

  runApp(
    ChangeNotifierProvider(
      create: (context) => IMCResultsProvider(),
      child: const MyApp(),
    ),
  );
}

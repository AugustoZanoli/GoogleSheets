import 'package:flutter/material.dart';
import 'package:fsheets/api_sheets/users_sheet_api.dart';
import 'package:fsheets/pages/create_sheets_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final String title = 'Google Sheet Api';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner:false,
      home: const CreateSheetsPage()
    );
  }
}

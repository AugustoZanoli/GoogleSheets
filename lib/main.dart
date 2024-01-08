import 'package:flutter/material.dart';
import 'package:fsheets/api_sheets/charcoal_sheet_api.dart'; 
import 'package:fsheets/pages/create_charcoal_page.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await CharcoalSheetApi.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final String title = 'Charcoal Sheet Api';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(MyApp.title),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateCharcoalPage()),
            );
          },
          child: Text('Cadastrar Carvão'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fsheets/api_sheets/charcoal_sheet_api.dart';
import 'package:fsheets/main.dart';
import 'package:fsheets/widget/button_widget.dart';
import 'package:fsheets/widget/charcoal_form_widget.dart';

class CreateCharcoalPage extends StatelessWidget {
  const CreateCharcoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Cadastro de Carvão'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/aperam.jfif"), // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: CharcoalFormWidget(
              onSavedCharcoal: (charcoal) async {
                final id = await CharcoalSheetApi.getRowCount() + 1;
                final newCharcoal = charcoal.copy(id: id);

                await CharcoalSheetApi.insert([newCharcoal.toJson()]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

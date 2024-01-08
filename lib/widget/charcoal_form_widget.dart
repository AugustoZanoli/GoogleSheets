import 'package:flutter/material.dart';
import 'package:fsheets/models/charcoal.dart'; // Importe a classe Charcoal
import 'package:fsheets/widget/button_widget.dart';

class CharcoalFormWidget extends StatefulWidget {
  final ValueChanged<Charcoal> onSavedCharcoal;

  const CharcoalFormWidget({
    Key? key,
    required this.onSavedCharcoal,
  }) : super(key: key);

  @override
  _CharcoalFormWidgetState createState() => _CharcoalFormWidgetState();
}

class _CharcoalFormWidgetState extends State<CharcoalFormWidget> {
  final formKey = GlobalKey<FormState>();
  late String selectedUper;
  late TextEditingController controllerBitola;
  late String selectedModeloForno;
  late TextEditingController controllerNumeroForno;
  late String selectedSupervisor;
  List<String> uperList = ["São Bento", "Pontal", "Chacára", "Cruz Grande", "Lagoa", "Palmeiras"];
  List<String> modeloFornoList = ["FAP 2000", "FAP 1000", "RAC 700", "FAP 300", "RAC 220"];
  List<String> supervisorList = ["Luisa", "Wesley", "Eliana", "Mônica", "Maria", "Paula", "Tarcísio", "Paulo", "Lusimar", "Bruno", "Ricardo", "Mateus", "Tamiris", "Bryan", "Dênis", "José Nelson", "Luciano", "Mauro", "Supervisor ausente", "Outro"];

  @override
  void initState() {
    super.initState();
    initCharcoal();
  }

  void initCharcoal() {
    selectedUper = uperList[0];
    controllerBitola = TextEditingController();
    selectedModeloForno = modeloFornoList[0];
    controllerNumeroForno = TextEditingController();
    selectedSupervisor = supervisorList[0];
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildUperDropdown(),
            const SizedBox(height: 16,),
            buildBitola(),
            const SizedBox(height: 16,),
            buildModeloFornoDropdown(),
            const SizedBox(height: 16,),
            buildNumeroForno(),
            const SizedBox(height: 16,),
            buildSupervisorDropdown(),
            const SizedBox(height: 16,),
            buildSubmit(),
          ],
        ),
      );

   Widget buildUperDropdown() => DropdownButtonFormField(
        value: selectedUper,
        items: uperList.map((uper) {
          return DropdownMenuItem(
            value: uper,
            child: Text(uper),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedUper = value.toString();
          });
        },
        decoration: InputDecoration(
          labelText: 'Uper',
          border: OutlineInputBorder(),
        ),
      );

  Widget buildBitola() => TextFormField(
        controller: controllerBitola,
        decoration: InputDecoration(
          labelText: 'Bitola',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Bitola' : null,
      );

   Widget buildModeloFornoDropdown() => DropdownButtonFormField(
        value: selectedModeloForno,
        items: modeloFornoList.map((modelo) {
          return DropdownMenuItem(
            value: modelo,
            child: Text(modelo),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedModeloForno = value.toString();
          });
        },
        decoration: InputDecoration(
          labelText: 'Modelo de Forno',
          border: OutlineInputBorder(),
        ),
      );

  Widget buildNumeroForno() => TextFormField(
        controller: controllerNumeroForno,
        decoration: InputDecoration(
          labelText: 'Número de Forno',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Número de Forno' : null,
      );

  Widget buildSupervisorDropdown() => DropdownButtonFormField(
        value: selectedSupervisor,
        items: supervisorList.map((supervisor) {
          return DropdownMenuItem(
            value: supervisor,
            child: Text(supervisor),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedSupervisor = value.toString();
          });
        },
        decoration: InputDecoration(
          labelText: 'Supervisor',
          border: OutlineInputBorder(),
        ),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();

          if (isValid) {
            final charcoal = Charcoal(
              uper: selectedUper,
              bitola: controllerBitola.text,
              modeloForno: selectedModeloForno,
              numeroForno: controllerNumeroForno.text,
              supervisor: selectedSupervisor,
            );
            widget.onSavedCharcoal(charcoal);
          }
        },
      );
}

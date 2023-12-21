import 'package:flutter/material.dart';
import 'package:fsheets/models/user.dart';
import 'package:fsheets/widget/button_widget.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({
    Key? key,

    required this.onSavedUser,
  }) : super (key: key);

  @override
 _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late bool isBegginer;

  @override
  void initState() {
    super.initState();

    initUser();
  }

  void initUser(){
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    this.isBegginer = true;
  }

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildName(),
        const SizedBox(height: 16,),
        buildEmail(),
        const SizedBox(height: 16,),
        buildFlutterBeginner(),
        const SizedBox(height: 16,),
        buildSubmit(),
      ],
    ),
  );

  Widget buildName() => TextFormField(
    controller: controllerName,
    decoration: InputDecoration(
      labelText: 'Nome',
      border: OutlineInputBorder(),
    ),
    validator: (value)=> value !=null && value.isEmpty ? 'Enter name' : null,
  );

  Widget buildEmail () => TextFormField(
    controller: controllerEmail,
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(),
    ),
    validator:  (value)=> value != null && !value.contains('@') ? 'Enter Email' : null,
  );

  Widget buildFlutterBeginner () => SwitchListTile(value: isBegginer,
  title: Text('É iniciante em flutter?'), 
  onChanged: (value)=> setState(() => isBegginer = value),
  );

  Widget buildSubmit() => ButtonWidget(
    text: 'Save',
     onClicked: () {
      final form = formKey.currentState!;
      final isValid = form.validate();

      if (isValid) {
        final user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          isBegginer: isBegginer,
          );
          widget.onSavedUser(user);
      }
     });
}
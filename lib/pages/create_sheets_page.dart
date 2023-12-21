import 'package:flutter/material.dart';
import 'package:fsheets/api_sheets/users_sheet_api.dart';
import 'package:fsheets/models/user.dart';
import 'package:fsheets/main.dart';
import 'package:fsheets/widget/button_widget.dart';
import 'package:fsheets/widget/user_form_widget.dart';

class CreateSheetsPage extends StatelessWidget {
  const CreateSheetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(MyApp.title), titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: UserFormWidget(
            onSavedUser: (user) async {
               final id = await UserSheetsApi.getRowCount() + 1;
               final newUser = user.copy(id: id);
          
               await UserSheetsApi.insert([newUser.toJson()]);
             }
            ),
        ),
        ),
      );
      }
  }

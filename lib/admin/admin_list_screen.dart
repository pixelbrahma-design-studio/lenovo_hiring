import 'package:flutter/material.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:provider/provider.dart';

class AdminListScreen extends StatelessWidget {
  const AdminListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin List')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Consumer<AuthState>(builder: (context, state, _) {
          return ListView.builder(
            itemCount: state.admins.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.admins[index].name),
                subtitle: Text(state.admins[index].email),
              );
            },
          );
        }),
      ),
    );
  }
}

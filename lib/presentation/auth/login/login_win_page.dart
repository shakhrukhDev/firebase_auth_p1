import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWinPage extends StatelessWidget {
   LoginWinPage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You are logged"),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Text("You are logged ${user?.email} ${user?.displayName}", style: const TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}

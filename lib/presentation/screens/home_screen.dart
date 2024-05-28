import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
            child: Text('Gestores de estado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
          ),
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestr de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),


          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestr de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/counter-bloc'); 
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

          ListTile(
            title: const Text('Nuevo usuario'),
            subtitle: const Text('Manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/register'); 
            },
          ),
        ],
      ),
    );
  }
}
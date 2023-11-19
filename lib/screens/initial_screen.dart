import 'package:flutter/material.dart';
import 'package:projeto_alura/components/task.dart';
import 'package:projeto_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task(
            name: 'Aprender Flutter',
            photo: 'assets/images/dash.png',
            difficulty: 3,
          ),
          Task(
            name: 'Andar de Bike',
            photo: 'assets/images/bike.jpg',
            difficulty: 2,
          ),
          Task(
            name: 'Meditar',
            photo: 'assets/images/meditar.jpeg',
            difficulty: 5,
          ),
          Task(
            name: 'Ler',
            photo: 'assets/images/livro.jpg',
            difficulty: 4,
          ),
          Task(
            name: 'Jogar',
            photo: 'assets/images/jogar.jpg',
            difficulty: 1,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

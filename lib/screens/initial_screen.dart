import 'package:flutter/material.dart';
import 'package:projeto_alura/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: ListView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

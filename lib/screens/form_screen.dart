import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
        elevation: 6,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Insira um URL de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (context, error, stackTrace) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/no-photo.png'),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('form enviado');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Salvando nova tarefa',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Adicionar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

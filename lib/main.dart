import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
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
                photo:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 3,
              ),
              Task(
                name: 'Andar de Bike',
                photo:
                    'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                difficulty: 2,
              ),
              Task(
                name: 'Meditar',
                photo:
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                difficulty: 5,
              ),
              Task(
                name: 'Ler',
                photo:
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                difficulty: 4,
              ),
              Task(
                name: 'Jogar',
                photo:
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                difficulty: 1,
              ),
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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Task(
      {super.key,
      required this.name,
      required this.photo,
      required this.difficulty});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.difficulty >= 1
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.difficulty >= 2
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.difficulty >= 3
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.difficulty >= 4
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.difficulty >= 5
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 78,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                level++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: widget.difficulty > 0
                              ? (level / widget.difficulty) / 10
                              : 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível: $level',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

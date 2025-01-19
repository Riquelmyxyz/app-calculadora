import 'package:flutter/material.dart';

import 'calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container( ),
            ),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        //   alignment: Alignment.center,
                        //  color: Colors.red,
                        //  child: const Text('Primeira Coluna'),
                        ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 162, 0, 255),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(230, 0, 0, 0),
                            blurRadius: 10,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: const Calculadora()
                    ),
                  ),
                  Expanded(
                    child: Container(
                        //   alignment: Alignment.center,
                        //  color: Colors.red,
                        //   child: const Text('Terceira coluna'),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                 //alignment: Alignment.center,
                // color: const Color.fromARGB(255, 255, 85, 7),
               // child: const Text('Layout Inferior'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Layout {}

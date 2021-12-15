import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isClicked = false;
  final duration = const Duration(seconds: 1);

  String textRetangle = "Pastel";
  String textCircle = "Pìzza";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio Transição dos Botôes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: AnimatedAlign(
            alignment: isClicked ? Alignment.topCenter : Alignment.bottomRight,
            duration: duration,
            curve: Curves.linear,
            child: AnimatedContainer(
              child: isClicked
                  ? Center(
                      child: Text(
                        textRetangle,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        textCircle,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
              duration: duration,
              height: 50,
              width: isClicked ? 100 : 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: isClicked ? null : BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

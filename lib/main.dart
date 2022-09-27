import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my counter cubit',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyhomePage(),
    );
  }
}

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '0',
          style: TextStyle(fontSize: 52.0),
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.add),
            heroTag: 'increment',
            ),
            SizedBox(width: 10.0,),
            FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.remove),
              heroTag: 'decrement',
              )
        ],
      ),
    );
  }
}
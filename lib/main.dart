import 'package:flutter/material.dart';
import 'package:provider_overview_03/models/dogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Overview 03',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dog = Dog(name: 'dog3', breed: 'breed3');
   @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
    
  }

  void dogListener(){
    print('age: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 03'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('- name: ${dog.name}', style: TextStyle(fontSize: 20.0,),),
             const SizedBox( height: 20.0,),
             BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
              Text('- breed: ${dog.breed}', style: TextStyle(fontSize: 20.0,),),
             const SizedBox( height: 20.0,),
             Age(dog: dog),
          ],
        ),
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({super.key, required this.dog});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('- age: ${dog.age}', style: const TextStyle(fontSize: 20.0,),),
             const SizedBox(height: 20.0,),
              ElevatedButton(onPressed: () => dog.grow(), 
              child: const Text('Grow', style:  TextStyle(fontSize: 20.0,),),),

          ],
        ),
    );
  }
}
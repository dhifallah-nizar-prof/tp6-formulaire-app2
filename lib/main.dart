import 'package:flutter/material.dart';
void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final _nombre1Controller=TextEditingController();
final _nombre2Controller=TextEditingController();
int somme=0;
void calculerSomme(){
  int nombre1=int.tryParse(_nombre1Controller.text)?? 0;
  int nombre2=int.tryParse(_nombre2Controller.text)?? 0;
  setState(() {
    somme=nombre1+nombre2;
  });
}
@override
void dispose() {
  _nombre1Controller.dispose();
  _nombre2Controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_box_rounded),
        title: const Text("Somme de deux nombres"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              TextField(
                controller: _nombre1Controller,
                  keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Donner un nombre",
                  border: OutlineInputBorder(),

              )),
              const SizedBox(height: 20),
              TextField(
                controller: _nombre2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Donner un autre nombre",
                    border: OutlineInputBorder(),

                  )),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: calculerSomme, child: const Text("Calculer")),
              const SizedBox(height: 20),
              Text("La somme est = $somme",
              style: TextStyle(fontSize: 20, color: Colors.blue),)
            ],
          ),
            )
    );
  }
}

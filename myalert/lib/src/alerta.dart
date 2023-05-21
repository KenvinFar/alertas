import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;
  late TextEditingController textEditingController;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void clearTextField() {
    textEditingController.clear();
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta!!!'),
          content: Text('Ingresa un nuevo nombre'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void refreshPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alertas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                child: Column(
                  children: [
                    Image.asset('assets/ecuador.png'),
                    
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Ingresa un nombre',
                style: const TextStyle(fontSize: 40.0, color: Color.fromARGB(255, 244, 119, 3)),
              ),
              TextField(
                controller: textEditingController,
                autofocus: true,
                focusNode: myFocusNode,
              ),
             
              Image.asset('assets/descarga.jpg'),
              SizedBox(height: 20.0),

                  
            ],
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
      
      bottomNavigationBar: Container(
        height: 56.0,
        color: Color.fromARGB(255, 12, 247, 90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Actualizar la página
                refreshPage();
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                // Limpiar el campo de texto
                clearTextField();
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                // Mostrar alerta
                showAlert();
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}


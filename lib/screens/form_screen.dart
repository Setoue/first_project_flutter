import 'package:flutter/material.dart';
import 'package:primeiro_flutter/data/task_dao.dart';
import '../components/task.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  void showMessage() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        TaskDao().save(Task(
            nameController.text,
            int.parse(difficultyController.text),
            imageController.text
        ));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Salvando nova tarefa'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Elemnentos a colocar
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome na tarefa';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.purple,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.purple),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (difficultyValidator(value)) {
                            return 'Insira uma dificuldade de 1 a 5';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.purple,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Dificuldade',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.purple),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira uma URL de Imagem';
                          }
                          return null;
                        },
                        controller: imageController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.purple,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Imagem',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.purple),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageController.text,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'images/semfoto.jpg',
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showMessage();
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Adicionar'),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

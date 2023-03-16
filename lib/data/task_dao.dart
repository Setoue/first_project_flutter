import 'package:primeiro_flutter/components/task.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT )';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  List<Task> convertMapToList(List<Map<String, dynamic>> mapaDeTarefas){

    final List<Task> tarefas = [];

    for(Map<String,dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name], linha[_difficulty], linha[_image]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(Task tarefa){
    Map<String, dynamic> map =  {
      _name: tarefa.nome,
      _difficulty: tarefa.dificuldade,
      _image: tarefa.nameImage,
    };

    return map;
  }

  save(Task tarefa) async {
    final Database database = await getDatabase();
    var itemExists = await find(tarefa.nome);
    if(itemExists.isEmpty){
      print('Tarefa não existia');
      return await database.insert(_tablename, toMap(tarefa));
    } else {
      print('A Tarefa já existe');
      return await database.update(_tablename, toMap(tarefa), where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll');

    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    return convertMapToList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa] );
    return convertMapToList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database database = await getDatabase();
    await database.delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}

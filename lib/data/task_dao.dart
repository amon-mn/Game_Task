import 'package:first_project/components/task.dart';
import 'package:first_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT'
      '$_difficulty INTEGER'
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _image = 'imagem';
  static const String _difficulty = 'dificuldade';

  save(Task task) async {
    print('Iniciando o save');
    final Database database = await getDatabase();
    var itemExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('A tarefa não existia.');
      return await database.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia.');
      return await database.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.name]);
    }
  }

  Map<String, dynamic> toMap(Task task) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.name;
    taskMap[_difficulty] = task.difficultyLevel;
    taskMap[_image] = task.picture;
    print('Nosso mapa de tarefas é: $taskMap');
    return taskMap;
  }

  Future<List<Task>> find(String nameTask) async {
    print('Acessando find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nameTask],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  Future<List<Task>> findAll() async {
    print('Acessando findAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Procurando dados no Banco de Dados... Encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print('Convertendo to List');
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task task = Task(
          name: line[_name],
          picture: line[_image],
          difficultyLevel: line[_difficulty]);
      tasks.add(task);
    }
    print("Lista de Tarefas: $tasks");
    return tasks;
  }

  delete(String nameTask) async {
    print('Deletando tarefa: $nameTask');
    final Database database = await getDatabase();
    return database
        .delete(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
  }
}

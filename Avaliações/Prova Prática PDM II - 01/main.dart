
// Beatriz de Oliveira Teixeira 


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Aluno {
  int? id;
  String nome;
  int idade;

  Aluno({this.id, required this.nome, required this.idade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
    };
  }

  static Aluno fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      nome: map['nome'],
      idade: map['idade'],
    );
  }
}

void main() async {
 
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'alunos.db');

  final Database db = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE TB_ALUNOS(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL,
          idade INTEGER NOT NULL
        )
      ''');
    },
  );

  Future<int> insertAluno(Aluno aluno) async {
    return await db.insert('TB_ALUNOS', aluno.toMap());
  }

  Future<List<Aluno>> getAllAlunos() async {
    final List<Map<String, dynamic>> maps = await db.query('TB_ALUNOS');
    return List.generate(maps.length, (i) {
      return Aluno.fromMap(maps[i]);
    });
  }

  Future<int> updateAluno(Aluno aluno) async {
    return await db.update(
      'TB_ALUNOS',
      aluno.toMap(),
      where: 'id = ?',
      whereArgs: [aluno.id],
    );
  }

  Future<int> deleteAluno(int id) async {
    return await db.delete(
      'TB_ALUNOS',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Aluno aluno1 = Aluno(nome: 'Camila Freitas', idade: 19);
  int id1 = await insertAluno(aluno1);
  print('Aluno inserido com ID: $id1');


  Aluno aluno2 = Aluno(nome: 'Tobias Menezes', idade: 21);
  int id2 = await insertAluno(aluno2);
  print('Aluno inserido com ID: $id2');


  List<Aluno> alunos = await getAllAlunos();
  print('Lista de Alunos:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }

   Aluno alunoAtualizado = alunos.first;
    alunoAtualizado.nome = 'Camila Souza';
    alunoAtualizado.idade = 21;
    print('Aluno com ID ${alunoAtualizado.id} atualizado para idade ${alunoAtualizado.idade}.');
  
 
  await deleteAluno(id1);
  print('Aluno com ID $id1 excluído.');


  alunos = await getAllAlunos();
  print('Lista de Alunos após exclusão:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }

  await db.close();
}



import 'package:oauhrunner/models/run.dart';
import 'package:oauhrunner/utils/database_service.dart';
import 'package:sqflite/sqflite.dart';

class RunDB {
  final tableName = "runs";

  Future<void> createTable(Database database) async {
    await database.execute("CREATE TABLE IF NOT EXISTS ${tableName} ('id' INTEGER NOT NULL, 'title' TEXT NOT NULL, 'start' TEXT NOT NULL, 'end' TEXT NOT NULL, 'date' TEXT, PRIMARY KEY('id' AUTOINCREMENT))");
  }

  Future<int> create(Run run) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (title,start,end,date) VALUES(?,?,?,?)''',
      [run.title,run.start,run.finish,run.date.toString()]
    );
  }


  Future<List<Run>> fetchAll() async {
    final database = await DatabaseService().database;
    final runs = await database.rawQuery(
      '''SELECT * FROM $tableName ORDER BY id'''
    );
    return runs.map((run) => Run.fromSQLite(run)).toList();
  }
}
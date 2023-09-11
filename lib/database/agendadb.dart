import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AgendaDB {

  static final nameDB = 'AGENDADB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database?> get database async {
    if( _database != null ) return _database!;
    return _database = await _initDatabase();
  }
  
  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path,nameDB);
    return openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables
    );
  }

  FutureOr<void> _createTables(Database db, int version) {
    String query = '''CREATE TABLE tblTareas( 
      idTask INTEGER PRIMARY KEY,
      nameTask VARCHAR(50),
      dscTask VARCHAR(50),
      sttTask BYTE,
    )''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String,dynamic> data) async {
    var  conexion = await database;
    return conexion!.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String,dynamic> data) async {
    var  conexion = await database;
    return conexion!.update(tblName, data, 
    where: 'idTask = ?', 
    whereArgs: [data['idTask']]);
  }

  Future<int> DELETE(String tblName, int idTask) async {
    var  conexion = await database;
    return conexion!.delete(tblName, 
      where: 'idTask = ?',
      whereArgs: [idTask]);
  }

  Future<List<?>> GETALLTASK() async{
    var conexion = await database;
    conexion.query('tblTask');
  }

}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/utils/db_keys.dart';
import 'package:todo_app/utils/task_keys.dart';

class TaskDataBasesource {
  static final TaskDataBasesource _instace = TaskDataBasesource._();
  factory TaskDataBasesource() => _instace;

  TaskDataBasesource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, DBKeys.dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${DBKeys.dbTable}(
        ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskKeys.title} TEXT,
        ${TaskKeys.note} TEXT,
        ${TaskKeys.date} TEXT,
        ${TaskKeys.time} TEXT,
        ${TaskKeys.category} TEXT,
        ${TaskKeys.isComplete} INTEGER
        )
''');
  }

  Future<int> addTask(TaskModels task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(TaskModels task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        DBKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<int> deleteTask(TaskModels task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        DBKeys.dbTable,
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<List<TaskModels>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      DBKeys.dbTable,
      orderBy: "id DESC",
    );

    return List.generate(data.length, (index) {
      return TaskModels.fromJson(data[index]);
    });
  }
}

import 'package:sqflite/sqflite.dart' as sql;

class peticionesDB {
  static Future<void> crearTabla(sql.Database database) async{
    await database.execute(""" CREATE TABLE posiciones (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      coordenadas TEXT,
      fecha TEXT
    ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("minticGEO.db", 
    version: 1, onCreate: (sql.Database database, int version) async{
      await crearTabla(database);
    });
  }

  //entrega JSON
  static Future<List<Map<String,dynamic>>> mostrarTodasUbicaciones() async {
    final base = await peticionesDB.db();
    return base.query("posiciones", orderBy: "fecha");
  }

  //eliminar ID
  static Future<void> eliminarunaPosicion(int idPosicion) async {
    final base = await peticionesDB.db();
    base.delete("posiciones", where: "id=?", whereArgs: [idPosicion]);
  }

  //eliminar todo
  static Future<void> eliminarTodasPosiciones(int idPosicion) async {
    final base = await peticionesDB.db();
    base.delete("posiciones");
  }

  static Future<void> guardarPosicion(coord, fech) async{
    final base = await peticionesDB.db();
    final datos = {"coordenadas": coord, "fecha": fech};
    await base.insert("posiciones", datos, 
      conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

}
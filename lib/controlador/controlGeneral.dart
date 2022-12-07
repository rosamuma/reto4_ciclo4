import 'package:get/get.dart';
import 'package:reto4flutter/proceso/peticiones.dart';

class controlGeneral extends GetxController {
  final Rxn <List<Map<String, dynamic>>> _ListaPosiciones = 
    Rxn <List<Map<String, dynamic>>> ();
  final _unaPosicion = "".obs;

  void cargaUnaPosicion (String x){
    _unaPosicion.value = x;
  }
  String get unaPosicion => _unaPosicion.value;

  void cargaListaPosiciones (List<Map<String, dynamic>> x){
    _ListaPosiciones.value = x;
  }

  List<Map<String, dynamic>>? get ListaPosiciones => _ListaPosiciones.value;

  Future<void> cargarTodaBD() async{
    final datos = await peticionesDB.mostrarTodasUbicaciones();
    cargaListaPosiciones(datos);
  }
  
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto4flutter/controlador/controlGeneral.dart';
import 'package:reto4flutter/proceso/peticiones.dart';

class listar extends StatefulWidget {
  const listar({super.key});

  @override
  State<listar> createState() => _listarState();
}

class _listarState extends State<listar> {

  controlGeneral control = Get.find();

  @override
  void initState() {
    super.initState();
    control.cargarTodaBD();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Container(
      child: control.ListaPosiciones?.isEmpty == false? ListView.builder(
        itemCount: control.ListaPosiciones!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.location_searching),
              trailing: IconButton(onPressed: (){
                peticionesDB.eliminarunaPosicion(control.ListaPosiciones![index]["id"]);
                }, 
                icon: Icon(Icons.delete_forever_sharp)),
              title: Text(control.ListaPosiciones![index]["coordenadas"]),
              subtitle: Text(control.ListaPosiciones![index]["fecha"]),

            ),
          );
      },
    ):
    Center(child: CircularProgressIndicator(),),
    ));
  }
}
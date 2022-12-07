import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto4flutter/controlador/controlGeneral.dart';
import 'package:reto4flutter/interfaz/listar.dart';
import 'package:reto4flutter/proceso/peticiones.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
controlGeneral control = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: listar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Alert(
            title: "ATENCIÓN!!!", 
            desc: "Está seguro que desea almacenar su ubicación?", 
            type: AlertType.info,
            buttons: [
              DialogButton(
                color: Colors.green,
                child: Text("SI"), 
                onPressed: (){
                  peticionesDB.guardarPosicion(
                  "245621,259863", DateTime.now().toString());
                  control.cargarTodaBD();
                  Navigator.pop(context);
                }),
              DialogButton(
                color: Colors.red,
                child: Text("NO"), 
                onPressed: (){
                  Navigator.pop(context);
                  control.cargarTodaBD();
                })
            ],
            context: context).show();

          
        },
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}
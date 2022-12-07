import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto4flutter/controlador/controlGeneral.dart';
import 'package:reto4flutter/interfaz/home.dart';

void main() {
  Get.put(controlGeneral());
  runApp(const MyApp());
}



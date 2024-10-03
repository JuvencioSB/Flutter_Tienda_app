import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter_android_studio/model/carrito/Carrito.dart';
import 'package:proyecto_flutter_android_studio/views/login.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Carrito(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const login(title: 'Inisia sesion'));
  }
}
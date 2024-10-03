import 'package:flutter/material.dart';
import 'package:proyecto_flutter_android_studio/views/pantalla_carta.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 45,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      top: 35,
                      bottom: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                      ),
                    ),
                    child: const RotatedBox(
                      quarterTurns: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Los Mejores Productos.",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 1.3,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 40,
                    color: Colors.black12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(13.0),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            builder: (BuildContext) => const pant_carta()));
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

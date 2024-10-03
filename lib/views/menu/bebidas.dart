// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:proyecto_flutter_android_studio/model/Carta.dart';
import 'package:proyecto_flutter_android_studio/model/carrito/Carrito.dart';

// ignore: camel_case_types
class bebidas_state extends StatefulWidget {
  final Carrito carrito;
  // ignore: use_key_in_widget_constructors
  const bebidas_state(this.carrito);
  @override
  bebidas_clas createState() => bebidas_clas();
}

// ignore: camel_case_types
class bebidas_clas extends State<bebidas_state> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: bebidas.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
          crossAxisSpacing: 5,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x000005cc),
                      blurRadius: 30,
                      offset: Offset(10, 5))
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/bebidas/${bebidas[index].imagen}",
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
                Text(
                  bebidas[index].nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "S/." + bebidas[index].precio.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      widget.carrito.agregarItem(
                        bebidas[index].id.toString(),
                        bebidas[index].nombre,
                        bebidas[index].precio,
                        "1",
                        "bebidas/" + bebidas[index].imagen,
                        1,
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20.0))),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Agregar"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

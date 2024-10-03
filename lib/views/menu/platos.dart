// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:proyecto_flutter_android_studio/model/Carta.dart';
import 'package:proyecto_flutter_android_studio/model/carrito/Carrito.dart';

// ignore: camel_case_types
class platos_option extends StatefulWidget {
  final Carrito carrito;
  // ignore: use_key_in_widget_constructors
  const platos_option(this.carrito);
  @override
  platos_clas createState() => platos_clas();
}

// ignore: camel_case_types
class platos_clas extends State<platos_option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: platos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(),
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
                  "assets/images/platos/${platos[index].imagen}",
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 3.3,
                ),
                Text(
                  platos[index].nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "S/." + platos[index].precio.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      widget.carrito.agregarItem(
                        platos[index].id.toString(),
                        platos[index].nombre,
                        platos[index].precio,
                        "1",
                        "platos/" + platos[index].imagen,
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

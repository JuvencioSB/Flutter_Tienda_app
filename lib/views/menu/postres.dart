// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:proyecto_flutter_android_studio/model/Carta.dart';
import 'package:proyecto_flutter_android_studio/model/carrito/Carrito.dart';

// ignore: camel_case_types
class postres_state extends StatefulWidget {
  final Carrito carrito;
  // ignore: use_key_in_widget_constructors
  const postres_state(this.carrito);
  @override
  postres_clas createState() => postres_clas();
}

// ignore: camel_case_types
class postres_clas extends State<postres_state> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: postres.length,
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
                  "assets/images/postres/${postres[index].imagen}",
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 3.3,
                ),
                Text(
                  postres[index].nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "S/." + postres[index].precio.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      widget.carrito.agregarItem(
                        postres[index].id.toString(),
                        postres[index].nombre,
                        postres[index].precio,
                        "1",
                        "postres/" + postres[index].imagen,
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

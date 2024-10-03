import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/carrito/Carrito.dart';

class Pantalla_carrito extends StatefulWidget {
  const Pantalla_carrito({Key? key}) : super(key: key);
  @override
  _PantallaCarritoState createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<Pantalla_carrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(189, 202, 202, 202),
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Pedidos"),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
          child: carrito.numeroItems == 0
              ? const Center(
                  child: Text("Carrito Vacio"),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (var item in carrito.items.values)
                        Card(
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/${item.imagen}",
                                width: 77,
                                height: 85,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 100,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(item.nombre),
                                        Text(
                                            "S/.${item.precio} x ${item.unidad}"),
                                        Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                child: IconButton(
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        carrito
                                                            .decrementarCantidadItem(
                                                                item.id);
                                                      });
                                                    }),
                                                width: 50,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                  color: Colors.purple,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                                child: Center(
                                                  child: Text(
                                                      item.cantidad.toString()),
                                                ),
                                              ),
                                              Container(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        carrito.incrementarItem(
                                                            item.id);
                                                      });
                                                    },
                                                  ),
                                                  width: 50,
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.purple,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                  )),
                                            ]),
                                      ]),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 70,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(218, 101, 140, 255)),
                                child: Center(
                                  child: Text(
                                    "S/.${item.precio * item.cantidad}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        color: Colors.white,
                        height: 167,
                        width: 350,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Text("Subtotal"),
                                  ),
                                  Text("S/.${carrito.subTotal}")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Text("Impuestos"),
                                  ),
                                  Text(
                                      "S/.${carrito.impuestos.toStringAsFixed(2)}")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Text("Total"),
                                  ),
                                  Text(
                                    "S/.${carrito.total.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        backgroundColor: Colors.amber),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                      )
                    ],
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String pedido = '';
            carrito.items.forEach((key, value) {
              pedido =
                  "$pedido${value.nombre}Catidad${value.cantidad}Precio Unitario${value.precio}Precio Total${(value.cantidad * value.precio).toStringAsFixed(2)}\n";
            });
            pedido = '$pedido' "Subtotal:" +
                carrito.subTotal.toStringAsFixed(2) +
                "\n";
            '$pedido'
                    "Impuesto:" +
                carrito.impuestos.toStringAsFixed(2) +
                "\n";
            '$pedido'
                    "Total:" +
                carrito.total.toStringAsFixed(2) +
                "\n";
            //print(pedido);
            //Vincular al Whasap
            final celular = '+529971000390';
            final mensaje = 'pedidos';
            final url =
                'whatsapp://send?phone=$celular&text=${Uri.parse(mensaje)}';

            try {
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
                print('El mensaje se envió correctamente por WhatsApp.');
              }
            } catch (e) {
              print('Error al enviar el mensaje: $e');
            }
          },
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}

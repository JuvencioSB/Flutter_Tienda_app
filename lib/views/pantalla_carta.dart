import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter_android_studio/model/carrito/Carrito.dart';
import 'package:proyecto_flutter_android_studio/views/login.dart';
import 'package:proyecto_flutter_android_studio/views/menu/bebidas.dart';
import 'package:proyecto_flutter_android_studio/views/menu/platos.dart';
import 'package:proyecto_flutter_android_studio/views/menu/postres.dart';
import 'package:proyecto_flutter_android_studio/views/pantalla_carrito.dart';

class pant_carta extends StatefulWidget {
  const pant_carta({Key? key}) : super(key: key);
  @override
  _pant_cartState createState() => _pant_cartState();
}

class _pant_cartState extends State<pant_carta> {
  final GlobalKey<ScaffoldMessengerState> _globalKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            key: _globalKey,
            backgroundColor: Color.fromARGB(255, 130, 130, 130),
            appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              title: const Text('Carta'),
              bottom: const TabBar(
                  labelColor: Colors.blue,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Platos',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Bebidas',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Postres',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
              actions: <Widget>[
                Stack(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        carrito.numeroItems != 0
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext) =>
                                        const Pantalla_carrito()),
                              )
                            : _globalKey.currentState
                                ?.showSnackBar((const SnackBar(
                                content: Text("Llenar el carrito"),
                              )));
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        constraints:
                            const BoxConstraints(minWidth: 14, minHeight: 14),
                        child: Text(
                          carrito.numeroItems.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            drawer: const Menu_lateral(),
            body: TabBarView(
              children: <Widget>[
                platos_option(carrito),
                bebidas_state(carrito),
                postres_state(carrito),
              ],
            ),
          ));
    });
  }
}

class Menu_lateral extends StatelessWidget {
  const Menu_lateral({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountEmail: Text('Jose Juvencio Santos Blanco'),
            accountName: Text(""),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                'Inicio',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.purple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  builder: (BuildContext) => const login(
                        title: 'Inisia sesion',
                      )));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                'Carrito',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.purple,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext) => const Pantalla_carrito()),
              );
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                'Restaurante',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Icon(
                Icons.account_box,
                color: Colors.purple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  builder: (BuildContext) => const pant_carta()));
            },
          ),
        ],
      ),
    );
  }
}

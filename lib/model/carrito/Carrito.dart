import 'package:flutter/foundation.dart';
import 'package:proyecto_flutter_android_studio/model/Item.dart';


class Carrito extends ChangeNotifier {
  Map<String, Item> _items = {};
  Map<String, Item> get items {
    return {..._items};
  }

  int get numeroItems {
    return _items.length;
  }

  double get subTotal {
    var total = 0.0;
    items.forEach(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        (Key, elementos) => total += elementos.precio * elementos.cantidad);
    return total;
  }

  double get impuestos {
    var total = 0.0;
    // ignore: unnecessary_this
    total = this.subTotal * 0.18;
    return total;
  }

  double get total {
    var total = 0.0;
    // ignore: unnecessary_this
    total = this.subTotal * 1.18;
    return total;
  }

  void agregarItem(String productoId, String nombre, double precio,
      String unidad, String imagen, int cantidad) {
    if (_items.containsKey(productoId)) {
      _items.update(
          productoId,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad + 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          productoId,
          () => Item(
              id: productoId,
              nombre: nombre,
              precio: precio,
              unidad: unidad,
              imagen: imagen,
              cantidad: 1));
      notifyListeners();
    }
  }

  void removerItem(String producId) {
    _items.remove(producId);
  }

  void incrementarItem(String productoId) {
    _items.update(
        productoId,
        (old) => Item(
            id: old.id,
            nombre: old.nombre,
            precio: old.precio,
            unidad: old.unidad,
            imagen: old.imagen,
            cantidad: old.cantidad + 1));
  }

  void decrementarCantidadItem(String productoId) {
    if (!_items.containsKey(productoId)) return;
    if (_items[productoId]!.cantidad > 1) {
      _items.update(
          productoId,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad - 1));
    } else {
      _items.remove(productoId);
      notifyListeners();
    }
  }

  void removeCarrito() {
    _items = {};
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_learn/shoppingCart/models/catalog.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalog;

  final List<int> _itemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(
      _itemsIds.every((id) => newCatalog.getById(id) != null),
      'Catalog $newCatalog does not have one of $_itemsIds in it',
    );

    _catalog = newCatalog;

    notifyListeners();
  }

  List<Item> get items => _itemsIds.map((id) => catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemsIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemsIds.remove(item.id);
    notifyListeners();
  }
}

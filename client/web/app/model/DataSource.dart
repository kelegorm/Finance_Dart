part of Model;

class DataSource {

  ObservableList<Purchase> _items;

  DataSource() { 
    _items = new ObservableList<Purchase>.from([
        new Purchase('Milk', 39, new DateTime(2014, 9, 25), null),
        new Purchase('Rice', 56, new DateTime(2014, 9, 25), null),
        new Purchase('Lemonade', 35, new DateTime(2014, 9, 26), null)
    ]);
  }

  ObservableList<Purchase> getItems() {
    return _items;
  }

  void pushPurchase(Purchase newPurchase) {
    _items.add(newPurchase);
  }
}

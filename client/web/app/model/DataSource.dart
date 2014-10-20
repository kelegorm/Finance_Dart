part of Model;

class DataSource {

  ObservableList<Purchase> _items;
  ObservableList<Purchase> getItems() => _items;

  DataSource() {
    _items = new ObservableList<Purchase>();
  }


  /**
   *  Init data source. Connecting to server
   */
  void connect() {
    _getPool();
  }

  void pushPurchase(Purchase newPurchase) {
    _items.add(newPurchase);
  }

  //--------------------------------
  //  P R I V A T E   M E T H O D S
  //--------------------------------

  /**
   *  Getting initial pool of data. Is calling one time only.
   */
  void _getPool() {
    HttpRequest.request('/purchases')
    .then((HttpRequest request) {
      Map data = JSON.decode(request.response);
      _items.clear();
      for (Map item in data) {
        _items.add(new Purchase.fromMap(item));
      }
      print(data);
    })
    .catchError((error) {
      print(error);
    });
  }
}

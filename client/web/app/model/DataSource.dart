part of Model;

class DataSource {

  ObservableList<Purchase> _items;
  ObservableList<Purchase> getItems() => _items;

  DataSource() {
    _items = new ObservableList<Purchase>();
  }

  //------------------------------
  //  P U B L I C   M E T H O D S
  //------------------------------

  /**
   *  Init data source. Connecting to server
   */
  void connect() {
    _getPool();
  }

  void pushPurchase(Purchase newPurchase) {
    HttpRequest.request('/purchase', method:'POST', sendData:newPurchase.toFormData())
    .then((_){
      _items.add(newPurchase);
    });
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
      print(JSON.encode(data));
      _items.clear();
      for (Map item in data) {
        _items.add(new Purchase.fromMap(item));
        print('iteration');
      }
    })
    .catchError((error) {
      print(error);
    });
  }
}

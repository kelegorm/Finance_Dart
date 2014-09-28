import 'package:polymer/polymer.dart';

import '../../model/index.dart';

@CustomTag('item-list')
class ItemList extends PolymerElement {

  @observable
  ObservableList<Purchase> dataProvider;
  
  @published
  void set purchases(ObservableList<Purchase> value) {
    dataProvider = groupByDays(value);
  }
  @published 
  ObservableList<Purchase> get purchases => dataProvider;
  
  ItemList.created() : super.created();
  
  ObservableList<Purchase> groupByDays(ObservableList<Purchase> value) {
    if (value == null) {
      return null;
    }
    
    return new MyCollection(value).result;
  }
}

class MyCollection {
  
  ObservableList<Purchase> _purchases;
  ObservableList<Purchase> _result;
  
  get result => _result;
  
  MyCollection(ObservableList<Purchase> purchases) {
    _purchases = purchases;
    _result = new ObservableList<Purchase>.from(purchases);
    _result.sort(compareByDate);
    
    purchases.changes.listen((List<ChangeRecord> records) {
      _result.clear();
      _result.addAll(_purchases);
      _result.sort(compareByDate);
    });
  }
  
  static int compareByDate(Purchase a, Purchase b) {
    int da = a.date.millisecondsSinceEpoch/* ~/ 86400000*/;
    int db = b.date.millisecondsSinceEpoch/* ~/ 86400000*/;
    
    return db - da;
  }
}


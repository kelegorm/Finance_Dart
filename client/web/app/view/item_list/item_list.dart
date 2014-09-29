import 'package:polymer/polymer.dart';

import '../../model/index.dart';

import 'itemListModel.dart';

@CustomTag('item-list')
class ItemList extends PolymerElement {

  @observable
  ObservableList<DayPurchases> dataProvider;

  ObservableList<Purchase> _purchases;
  
  @published
  void set purchases(ObservableList<Purchase> value) {
    _purchases = value;
    dataProvider = groupByDays(value);
  }
  @published 
  ObservableList<Purchase> get purchases => _purchases;
  
  
  ItemList.created() : super.created();
  
  
  ObservableList<DayPurchases> groupByDays(ObservableList<Purchase> value) {
    if (value == null) {
      return null;
    }
    
    return new MyCollection(value).result;
  }
}
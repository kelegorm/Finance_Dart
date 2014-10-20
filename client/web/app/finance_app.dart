import 'dart:html';

import 'package:polymer/polymer.dart';

import 'model/index.dart';

@CustomTag('finance-app')
class FinanceApp extends PolymerElement {

  //--------------------
  //  P A R T S
  //--------------------

  DivElement _addPurchaseForm;
  
  //--------------------
  //  P U B L I C
  //--------------------
  
  @observable
  String newPurchaseText = 'ert';

  @observable
  String newPurchasePrice = '23';

  @observable
  ObservableList<Purchase> purchases;

  
  //--------------------
  //  P R I V A T E
  //--------------------
  
  DataSource _dataSource;

  FinanceApp.created() : super.created() {
    _dataSource = new DataSource();
    _dataSource.connect();

    purchases = _dataSource.getItems();
  }
  
  @override
  void attached() {
    super.attached();
    
    _addPurchaseForm = $['addPurchaseForm'];
//    _addPurchaseForm.hidden = true;
  }

  void addPurchaseButton_click(MouseEvent event) {
    _dataSource.pushPurchase(new Purchase(newPurchaseText, num.parse(newPurchasePrice), new DateTime.now(), null));
    newPurchaseText = '';
    newPurchasePrice = '';
  }
}

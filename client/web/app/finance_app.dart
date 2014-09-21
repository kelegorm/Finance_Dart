import 'package:polymer/polymer.dart';

import 'model/index.dart';

@CustomTag('finance-app')
class FinanceApp extends PolymerElement {

  @observable
  List<Purchase> purchases;

  DataSource _dataSource;

  FinanceApp.created() : super.created() {
    _dataSource = new DataSource();

    purchases = _dataSource.getItems();
  }
}

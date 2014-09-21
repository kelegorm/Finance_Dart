import 'package:polymer/polymer.dart';

import 'model/index.dart';

@CustomTag('finance-app')
class FinanceApp extends PolymerElement {

  @observable
  List<Purchase> purchases;

  FinanceApp.created() : super.created() {
    purchases = [
      new Purchase('Milk', 39, new DateTime.now(), null),
      new Purchase('Rice', 56, new DateTime.now(), null),
      new Purchase('Lemonade', 35, new DateTime.now(), null)
    ];
  }
}

import 'package:polymer/polymer.dart';

import '../../model/index.dart';

@CustomTag('item-list')
class ItemList extends PolymerElement {

  @published
  List<Purchase> dataProvider;

  ItemList.created() : super.created() {

  }
}

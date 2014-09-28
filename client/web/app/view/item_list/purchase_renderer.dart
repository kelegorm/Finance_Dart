import 'package:polymer/polymer.dart';

import '../../model/index.dart';

@CustomTag('purchase-renderer')
class PurchaseRenderer extends PolymerElement {

  @published
  Purchase data;

  PurchaseRenderer.created() : super.created() {

  }

}
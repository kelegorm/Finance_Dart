import 'package:polymer/polymer.dart';

import 'itemListModel.dart';

import '../../dateTimeUtils/dateTimeUtils.dart';
import '../../model/index.dart';

@CustomTag('day-purchases-list')
class DayPurchasesList extends PolymerElement{
  
  DayPurchases _data;
  
  @published
  void set data(DayPurchases value) {
    _data = value;
    dayLabel = getDayLabel(value.day);
    total = calcTotal(_data.items);
  }
  @published
  DayPurchases get data => _data;
  
  @observable
  String dayLabel;
  
  @observable
  num total;
  
  
  DayPurchasesList.created() : super.created();
  
  
  String getDayLabel(DateTime date) {
    String year = (date.year != getCurrentYear()) ? ', $date.year' : '' ;
    
    String month = getFullMonthName(date);
    
    return '$month ${date.day}$year';
  }
  
  num calcTotal(List<Purchase> data) {
    num result = 0;
    for (Purchase item in data) {
      result += item.price;
    }
    
    return result;
  }
}
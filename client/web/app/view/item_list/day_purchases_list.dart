import 'package:polymer/polymer.dart';

import 'itemListModel.dart';

import '../../dateTimeUtils/dateTimeUtils.dart';

@CustomTag('day-purchases-list')
class DayPurchasesList extends PolymerElement{
  
  DayPurchases _data;
  
  @published
  void set data(DayPurchases value) {
    _data = value;
    dayLabel = getDayLabel(value.day);
  }
  @published
  DayPurchases get data => _data;
  
  @observable
  String dayLabel;
  
  
  DayPurchasesList.created() : super.created();
  
  
  String getDayLabel(DateTime date) {
    String year = (date.year != getCurrentYear()) ? ', $date.year' : '' ;
    
    String month = getFullMonthName(date);
    
    return '$month ${date.day}$year';
  }
}
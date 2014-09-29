library itemListModel;

import 'package:polymer/polymer.dart';

import '../../model/index.dart';

import '../../dateTimeUtils/dateTimeUtils.dart';

class MyCollection {
  
  ObservableList<Purchase> _purchases;
  ObservableList<DayPurchases> _result;
  
  get result => _result;
  
  MyCollection(ObservableList<Purchase> purchases) {
    _purchases = purchases;
    _result = new ObservableList<DayPurchases>();
    
    for (Purchase purchase in purchases) {
      pushItem(purchase);
    }
    
    purchases.changes.listen((List<ChangeRecord> records) {
      _result.clear();

      for (Purchase purchase in purchases) {
        pushItem(purchase);
      }
      
      _result.sort(DayPurchases.compareByDate);
    });
  }
  
  void pushItem(Purchase item) {
    DayPurchases dayp = getDayOrCreate(item.date);
    dayp.addPurchase(item);
  }
  
  /**
   *  Return day by date or create one new, push it in collection and return
   */
  DayPurchases getDayOrCreate(DateTime date) {
    DayPurchases day = getDayByDate(date);
    
    if (day == null) {
      day = new DayPurchases(date);
      _result.add(day);
    }
    
    return day;
  }
  
  DayPurchases getDayByDate(DateTime date) {
    for (DayPurchases day in _result) {
      if (day.isSameDay(date)) {
        return day;
      }
    }
    
    return null;
  }
}

class DayPurchases {
  DateTime day;
  
  @observable
  ObservableList<Purchase> items;
  
  DayPurchases(this.day) {
    items = new ObservableList<Purchase>();
  }
  
  void addPurchase(Purchase item) {
    items.add(item);
  }
  
  /**
   *  Return true if dates are compaire by day 
   */
  bool isSameDay(DateTime otherDate) {
    return compareByDay(day, otherDate) == 0;
  }
  
  static int compareByDate(DayPurchases a, DayPurchases b) {
    int da = a.day.millisecondsSinceEpoch ~/ 86400000;
    int db = b.day.millisecondsSinceEpoch ~/ 86400000;
    
    return db - da;
  }
}
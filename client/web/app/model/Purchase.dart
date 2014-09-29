part of Model;

class Purchase {

  DateTime date;
  String good;
  num price;
  List<String> tags;

  Purchase(this.good, this.price, this.date, this.tags) {
  }
  
  static int compareByDate(Purchase a, Purchase b) {
    int da = a.date.millisecondsSinceEpoch ~/ 86400000;
    int db = b.date.millisecondsSinceEpoch ~/ 86400000;
    
    return db - da;
  }
}

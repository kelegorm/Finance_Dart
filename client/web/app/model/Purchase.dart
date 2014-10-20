part of Model;

class Purchase {

  DateTime date;
  String good;
  num price;
  List<String> tags;

  Purchase(this.good, this.price, this.date, this.tags) {
  }

  Purchase.fromMap(Map input) {
    if (input.containsKey('name')) {
      good = input['name'];
    } else {
      good = '';
    }

    if (input.containsKey('price')) {
      price = input['price'];
    } else {
      price = 0;
    }

    if (input.containsKey('date')) {
      date = DateTime.parse(input['date']);
    } else {
      date = new DateTime.now();
    }

    if (input.containsKey('tags')) {
      tags = input['tags'];
    } else {
      tags = [];
    }
  }
  
  static int compareByDate(Purchase a, Purchase b) {
    int da = a.date.millisecondsSinceEpoch ~/ 86400000;
    int db = b.date.millisecondsSinceEpoch ~/ 86400000;
    
    return db - da;
  }
}

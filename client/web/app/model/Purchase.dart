part of Model;

class Purchase {

  DateTime date;
  String good;
  num price;
  List<String> tags;

  Purchase(this.good, this.price, this.date, this.tags) {
  }
}

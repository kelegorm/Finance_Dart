part of Model;

class DataSource {


  DataSource() {
  }

  List<Purchase> getItems() {
    return [
        new Purchase('Milk', 39, new DateTime.now(), null),
        new Purchase('Rice', 56, new DateTime.now(), null),
        new Purchase('Lemonade', 35, new DateTime.now(), null)
    ];
  }
}

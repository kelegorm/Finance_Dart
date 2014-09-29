library dateTimeUtils;

int compareByDay(DateTime a, DateTime b) {
  int da = a.millisecondsSinceEpoch ~/ 86400000;
  int db = b.millisecondsSinceEpoch ~/ 86400000;
  
  return da - db;
}

int compareByDayInvert(DateTime a, DateTime b) {
  int da = a.millisecondsSinceEpoch ~/ 86400000;
  int db = b.millisecondsSinceEpoch ~/ 86400000;
  
  return db - da;
}

int _currentYear;

int getCurrentYear() {
  if (_currentYear == null) {
    _currentYear = new DateTime.now().year;
  }
  
  return _currentYear;
}

List<String> _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'Octomber',
  'November',
  'December'
];

List<String> _shortMonths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'June',
  'July',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];

String getFullMonthName(DateTime date) {
  return (date != null) ? _months[date.month] : null; 
}
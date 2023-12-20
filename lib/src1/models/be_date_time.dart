class BEDateTime {
  final int year;
  final int month;
  final int day;

  BEDateTime(
    this.year, [
    this.month = 1,
    this.day = 1,
  ]);

  factory BEDateTime.now() {
    final now = DateTime.now();
    final beYear = now.year + 543;
    return BEDateTime(beYear, now.month, now.day);
  }

  bool operator ==(Object other) =>
      identical(this, other) || other is BEDateTime && runtimeType == other.runtimeType && year == other.year && month == other.month && day == other.day;

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
  bool isBefore(BEDateTime other) {
    if (year < other.year) {
      return true;
    } else if (year == other.year) {
      if (month < other.month) {
        return true;
      } else if (month == other.month) {
        return day < other.day;
      }
    }
    return false;
  }

  bool isAfter(BEDateTime other) {
    if (year > other.year) {
      return true;
    } else if (year == other.year) {
      if (month > other.month) {
        return true;
      } else if (month == other.month) {
        return day > other.day;
      }
    }
    return false;
  }

  DateTime toGregorianDateTime() {
    final adYear = year - 543;
    return DateTime(adYear, month, day);
  }

  @override
  String toString() => '$year-$month-$day BE';
}

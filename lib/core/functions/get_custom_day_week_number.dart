int getCustomWeekDayNumber(DateTime date) {
  switch (date.weekday) {
    case DateTime.saturday:
      return 1;
    case DateTime.sunday:
      return 2;
    case DateTime.monday:
      return 3;
    case DateTime.tuesday:
      return 4;
    case DateTime.wednesday:
      return 5;
    case DateTime.thursday:
      return 6;
    case DateTime.friday:
      return 7;
    default:
      return 0;
  }
}

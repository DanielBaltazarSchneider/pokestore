class DateTimeFormat {
  static String format_DD_MM_YYYY(String date) {
    try {
      String _day = "";
      String _month = "";
      DateTime f = DateTime.parse(date);
      if (f.day < 10) {
        _day = "0${f.day}";
      } else {
        _day = f.day.toString();
      }
      if (f.month < 10) {
        _month = "0${f.month}";
      } else {
        _month = f.month.toString();
      }
      return "$_day/$_month/${f.year}";
    } catch (e) {
      return "incorrect date";
    }
  }
}

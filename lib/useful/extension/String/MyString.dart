import 'package:pokestore/useful/dateFormat/DateTimeFormat.dart';

extension MyString on String {
  String formatDate() {
    return DateTimeFormat.format_DD_MM_YYYY(this);
  }

  String toFirthUpperCase() {
    try {
      return this[0].toUpperCase() + this.substring(1).toLowerCase();
    } catch (e) {
      return "";
    }
  }
}

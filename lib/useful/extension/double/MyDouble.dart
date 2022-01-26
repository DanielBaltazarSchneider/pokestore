import 'package:intl/intl.dart';

extension MyDouble on double {
  String toFormat0_00() {
    try {
      return NumberFormat('#,##0.00', 'pt_BR').format(this);
    } catch (e) {
      return this.toString();
    }
  }
}

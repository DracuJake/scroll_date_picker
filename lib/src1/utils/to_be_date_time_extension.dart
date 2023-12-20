import 'package:scroll_date_picker/src1/models/be_date_time.dart';

extension convertBEDateTime on DateTime {
  BEDateTime toBEDateTime() {
    final beYear = this.year + 543;
    return BEDateTime(beYear,this.month,this.day);
  }
}

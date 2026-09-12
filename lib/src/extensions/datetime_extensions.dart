/// DateTime helpers.
extension DateTimeX on DateTime {
  /// Date-only (year / month / day), time zeroed.
  DateTime get toDate => DateTime(year, month, day);
}

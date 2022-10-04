extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}

extension ExtString on String {
  String get prettyTitle =>
      replaceAll(RegExp(r'(\[.*?\]|\(.*?\))|{.*?}'), '').trim();

  String get processApi => replaceAllMapped(
          RegExp(r'"id":\s*"(\d+)",'), (match) => '"id":${match.group(1)},')
      .replaceAllMapped(RegExp(r'"media_id":\s+(\d+),'),
          (match) => '"id": "${match.group(1)}",')
      .replaceAllMapped(
          RegExp(r'"w":\s*"(\d+)",'), (match) => '"w":${match.group(1)},')
      .replaceAllMapped(
          RegExp(r'"h":\s*"(\d+)",'), (match) => '"h":${match.group(1)},')
      .replaceAllMapped(RegExp(r'"count":\s*"(\d+)",'),
          (match) => '"count":${match.group(1)},');
}

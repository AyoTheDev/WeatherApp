extension DateTimeExt on DateTime {
  DateTime roundDown({Duration delta = const Duration(hours: 1)}) {
    return DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds,
    );
  }
}

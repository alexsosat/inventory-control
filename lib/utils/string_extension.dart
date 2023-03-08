extension StringExtension on String? {
  /// Returns true if the string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns true if the string is not null or empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

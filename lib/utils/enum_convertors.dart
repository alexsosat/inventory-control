// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

/// It takes an enum value and returns the string representation of the enum value
///
/// Args:
///   o (Object): The object to convert to a string.
String enumToString(Object? o) => o.toString().split('.').last;

/// It takes a string and a list of enums, and returns the enum that matches the string
///
/// Args:
///   key (String): The string to convert to an enum.
///   values (List<T>): The list of values to search through.
T? enumFromString<T>(String key, List<T> values) =>
    values.firstWhereOrNull((v) => key == enumToString(v));

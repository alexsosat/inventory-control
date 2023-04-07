import 'package:isar/isar.dart';

part 'notification.g.dart';

@collection
class NotificationAlert {
  Id id = Isar.autoIncrement;

  final String title;
  final String body;

  NotificationAlert({
    required this.title,
    required this.body,
  });

  @override
  String toString() => 'NotificationAlert(id: $id, title: $title, body: $body)';
}

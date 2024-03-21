import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  /// The Author of the quote.
  @HiveField(0)
  late String author;

  /// The database id of the quote.
  @HiveField(1)
  late String id;

  /// Text of the quote.
  @HiveField(2)
  late String content;

  /// An URL where the quote can be found.
  @HiveField(3)
  late String dateAdded;

  Quote({
    required this.author,
    required this.id,
    required this.content,
    required this.dateAdded,
  });

Quote.fromJson(Map<String, dynamic> json) {
    author = json['author'] as String;
    id = json['_id'] as String;
    content = json['content'] as String;
    dateAdded = json['dateAdded'] as String;
  }


}

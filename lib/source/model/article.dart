import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'article.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Article extends Equatable{
  @HiveField(0)
  late final String? title;
  @HiveField(1)
  late final String? author;
  @HiveField(2)
  late final String? description;
  @HiveField(3)
  late final String? urlToImage;
  @HiveField(4)
  late final String? content;
  @HiveField(5)
  late final String? publishedAt;
  @HiveField(6)
  late final String? url;

  Article({
    required this.title,
    this.author,
    this.urlToImage,
    this.description,
    this.content,
    this.url,
    this.publishedAt
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props=> [title];
}
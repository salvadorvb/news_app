// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      author: json['author'] as String?,
      urlImage: json['urlImage'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
    )..url = json['url'] as String?;

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'urlImage': instance.urlImage,
      'content': instance.content,
      'url': instance.url,
    };

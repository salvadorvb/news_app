import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/source/app.dart';
import 'package:news_app/source/provider/news_provider.dart';
import 'package:news_app/source/repository/implementation/news_repository.dart';
import 'package:news_app/source/repository/news_repository.dart';

void main() async{
  final newsProvider = NewsProvider();
  final newsRepository = NewsRepository(newsProvider);

  runApp(
    RepositoryProvider<NewsRepositoryBase>(
      create: (_) => newsRepository,
      child: MyApp(),
    ),
  );
}


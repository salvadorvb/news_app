import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/source/app.dart';
import 'package:news_app/source/provider/favorite_provider.dart';
import 'package:news_app/source/provider/news_provider.dart';
import 'package:news_app/source/repository/implementation/news_repository.dart';
import 'package:news_app/source/repository/news_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  final newsProvider = NewsProvider();
  final newsRepository = NewsRepository(newsProvider);
  Hive.initFlutter();

  runApp(
    RepositoryProvider<NewsRepositoryBase>(
      create: (_) => newsRepository,
      child: ChangeNotifierProvider(
        create: (_) => FavoriteProvider(),
        child: MyApp(),
      ),
    ),
  );
}


/*
ChangeNotifierProvider(
  create: (_) => NewsProvider(),
  child: ChangeNotifierProvider(
    create: (_) => FavoriteProvider(),
    child: MyApp(),
  ),


  MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => NewsProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
  ],
  child: MyApp(),
)

//goodone
runApp(
    RepositoryProvider<NewsRepositoryBase>(
      create: (_) => newsRepository,
      child: ChangeNotifierProvider(
        create: (_) => FavoriteProvider(),
        child: MyApp(),
      ),
    ),
  );

)
* */
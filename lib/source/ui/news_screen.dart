

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_cubit.dart';
import '../model/article.dart';
import '../navigation/routes.dart';
import '../repository/news_repository.dart';

class NewsScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (_) => NewsCubit(context.read<NewsRepositoryBase>())..loadTopNews(),
      child: NewsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top news'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadCompleteState) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (_, int index) => _ListItem(article: state.news[index]),
            );
          } else if (state is NewsErrorState) {
            return Text(state.message);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Article article;

  const _ListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.newsDetails, arguments: article),
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            article.urlImage == null
                ? Container(color: Colors.red, height: 250)
                : CachedNetworkImage(
              imageUrl: article.urlImage!,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
              '${article.title}',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${article.description}', maxLines: 3),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
import '../../model/article.dart';
import '../../provider/news_provider.dart';
import '../news_repository.dart';

class NewsRepository extends NewsRepositoryBase {
  final NewsProvider _provider;
  NewsRepository(this._provider);
  @override
  Future<List<Article>> topHeadlines(String country) => _provider.topHeadlines(country);
}
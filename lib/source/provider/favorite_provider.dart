
import 'package:flutter/cupertino.dart';
import 'package:news_app/source/model/article.dart';
import 'package:hive/hive.dart';

class FavoriteProvider extends ChangeNotifier{
  List<Article> _favArticle = [];
  List<Article> get articles => _favArticle;
  late final Box hiveBox;


  FavoriteProvider() {
    initBox();
  }

  initBox() async {
    hiveBox = await Hive.openBox('favorits');
  }

  void toggleFavorite(Article article){
    final isExist = _favArticle.contains(article);
    if(isExist){
      _favArticle.remove(article);
    } else {
      _favArticle.add(article);
    }
    notifyListeners();
  }

  void toggleFavorites(Article article) async{
    final isExist = await favIsExist(article);
    if(isExist){
      removeFromFavorits(article);
    } else {
      addToFavorits(article);
    }
    notifyListeners();
  }

  bool isExist(Article article){
    final isExist = _favArticle.contains(article);
    return isExist;
  }

  void clearFavorite(){
    _favArticle = [];
    notifyListeners();
  }

  Future addToFavorits(Article article) async {
    late final List favorits;
    favorits = getFavorits();
    favorits.add(article);
    await hiveBox.put("favorits", favorits);
  }

  Future favIsExist(Article article) async{
    late final List favorits;
    favorits = getFavorits();
    var removableIndex = 0;
    favorits.asMap().forEach((index, element) {
      if (element["publishedAt"] == article.publishedAt) {
        removableIndex = index;
      }
    });
    return removableIndex == 0 ? false :  true;
  }

  Future removeFromFavorits(Article article) async {
    late final List favorits;
    favorits = getFavorits();
    var removableIndex = 0;
    favorits.asMap().forEach((index, element) {
      if (element["publishedAt"] == article.publishedAt) {
        removableIndex = index;
      }
    });
    favorits.removeAt(removableIndex);
    await hiveBox.put("favorits", favorits);
  }

  getFavorits() {
    return hiveBox.get("favorits") ?? [];
  }

}
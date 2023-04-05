import 'package:rxdart/rxdart.dart';

class RecentSearchesStore {
  factory RecentSearchesStore() {
    return _singleton;
  }

  RecentSearchesStore._internal();

  final recentSearches = BehaviorSubject<List<String>>();

  static final RecentSearchesStore _singleton = RecentSearchesStore._internal();
}


class RecentDishesSearchesStore {
  factory RecentDishesSearchesStore() {
    return _singleton;
  }

  RecentDishesSearchesStore._internal();

  final recentSearches = BehaviorSubject<List<String>>();

  static final RecentDishesSearchesStore _singleton = RecentDishesSearchesStore._internal();
}

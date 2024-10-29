import 'package:mobx/mobx.dart';

part 'stock_store.g.dart';

class StockStore = _StockStore with _$StockStore;

abstract class _StockStore with Store {
  @observable
  String searchQuery = '';

  @action
  void updateSearchQuery(String value) {
    searchQuery = value;
  }
}

part of 'stock_bloc.dart';

abstract class StockEvent {}

class LoadStocks extends StockEvent {}

class SearchStock extends StockEvent {
  final String query;
  SearchStock(this.query);
}

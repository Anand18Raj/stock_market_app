part of 'stock_bloc.dart';

abstract class StockState {}

class StockInitial extends StockState {}

class StocksLoaded extends StockState {
  final List<Stock> stocks;
  StocksLoaded(this.stocks);
}

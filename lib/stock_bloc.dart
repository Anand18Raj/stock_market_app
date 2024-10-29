import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'stock_model.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<LoadStocks>((event, emit) async {
      final stocks = await _loadStocks();
      emit(StocksLoaded(stocks));
    });

    on<SearchStock>((event, emit) {
      if (state is StocksLoaded) {
        final currentState = state as StocksLoaded;
        final filteredStocks = currentState.stocks
            .where((stock) => stock.symbol.contains(event.query))
            .toList();
        emit(StocksLoaded(filteredStocks));
      }
    });
  }

  Future<List<Stock>> _loadStocks() async {
    final String response = await rootBundle.loadString('assets/stocks.json');
    final Map<String, dynamic> data = json.decode(response);
    return (data['data'] as List)
        .map((e) => Stock.fromJson(e))
        .toList();
  }
}

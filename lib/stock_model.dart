import 'package:json_annotation/json_annotation.dart';

part 'stock_model.g.dart';

@JsonSerializable()
class Stock {
  final String symbol;
  final String exchange;
  // Add other fields as needed

  Stock({required this.symbol, required this.exchange});

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}

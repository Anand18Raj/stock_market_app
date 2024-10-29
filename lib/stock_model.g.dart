// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      symbol: json['symbol'] as String,
      exchange: json['exchange'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'exchange': instance.exchange,
    };

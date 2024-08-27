// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model_stock_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsetModelStockPrice _$ResponsetModelStockPriceFromJson(
        Map<String, dynamic> json) =>
    ResponsetModelStockPrice(
      totalTradeRealReply: TotalTradeRealReply.fromJson(
          json['TotalTradeRealReply'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponsetModelStockPriceToJson(
        ResponsetModelStockPrice instance) =>
    <String, dynamic>{
      'TotalTradeRealReply': instance.totalTradeRealReply,
    };

TotalTradeRealReply _$TotalTradeRealReplyFromJson(Map<String, dynamic> json) =>
    TotalTradeRealReply(
      codeReply: CodeReply.fromJson(json['codeReply'] as Map<String, dynamic>),
      stockTotalReals: (json['stockTotalReals'] as List<dynamic>)
          .map((e) => StockTotalReal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TotalTradeRealReplyToJson(
        TotalTradeRealReply instance) =>
    <String, dynamic>{
      'codeReply': instance.codeReply,
      'stockTotalReals': instance.stockTotalReals,
    };

CodeReply _$CodeReplyFromJson(Map<String, dynamic> json) => CodeReply(
      codeId: json['codeID'] as String,
      codeName: json['codeName'] as String,
    );

Map<String, dynamic> _$CodeReplyToJson(CodeReply instance) => <String, dynamic>{
      'codeID': instance.codeId,
      'codeName': instance.codeName,
    };

StockTotalReal _$StockTotalRealFromJson(Map<String, dynamic> json) =>
    StockTotalReal(
      close: (json['close'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      open: (json['open'] as num).toDouble(),
      ticker: json['ticker'] as String,
      vol: (json['vol'] as num).toInt(),
    );

Map<String, dynamic> _$StockTotalRealToJson(StockTotalReal instance) =>
    <String, dynamic>{
      'close': instance.close,
      'date': instance.date.toIso8601String(),
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
      'ticker': instance.ticker,
      'vol': instance.vol,
    };

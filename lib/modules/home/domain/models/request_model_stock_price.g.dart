// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model_stock_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModelStockPrice _$RequestModelStockPriceFromJson(
        Map<String, dynamic> json) =>
    RequestModelStockPrice(
      totalTradeRealRequest: TotalTradeRealRequest.fromJson(
          json['TotalTradeRealRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestModelStockPriceToJson(
        RequestModelStockPrice instance) =>
    <String, dynamic>{
      'TotalTradeRealRequest': instance.totalTradeRealRequest,
    };

TotalTradeRealRequest _$TotalTradeRealRequestFromJson(
        Map<String, dynamic> json) =>
    TotalTradeRealRequest(
      account: json['account'] as String,
    );

Map<String, dynamic> _$TotalTradeRealRequestToJson(
        TotalTradeRealRequest instance) =>
    <String, dynamic>{
      'account': instance.account,
    };

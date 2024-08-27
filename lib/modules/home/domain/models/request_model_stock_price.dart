import 'package:json_annotation/json_annotation.dart';
part 'request_model_stock_price.g.dart';

@JsonSerializable()
class RequestModelStockPrice {
  @JsonKey(name: "TotalTradeRealRequest")
  TotalTradeRealRequest totalTradeRealRequest;

  RequestModelStockPrice({
    required this.totalTradeRealRequest,
  });

  factory RequestModelStockPrice.fromJson(Map<String, dynamic> json) =>
      _$RequestModelStockPriceFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelStockPriceToJson(this);
}

@JsonSerializable()
class TotalTradeRealRequest {
  @JsonKey(name: "account")
  String account;

  TotalTradeRealRequest({
    required this.account,
  });

  factory TotalTradeRealRequest.fromJson(Map<String, dynamic> json) =>
      _$TotalTradeRealRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TotalTradeRealRequestToJson(this);
}

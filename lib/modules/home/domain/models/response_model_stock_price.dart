import 'package:json_annotation/json_annotation.dart';
part 'response_model_stock_price.g.dart';

@JsonSerializable()
class ResponsetModelStockPrice {
  @JsonKey(name: "TotalTradeRealReply")
  TotalTradeRealReply totalTradeRealReply;

  ResponsetModelStockPrice({
    required this.totalTradeRealReply,
  });

  factory ResponsetModelStockPrice.fromJson(Map<String, dynamic> json) =>
      _$ResponsetModelStockPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsetModelStockPriceToJson(this);
}

@JsonSerializable()
class TotalTradeRealReply {
  @JsonKey(name: "codeReply")
  CodeReply codeReply;
  @JsonKey(name: "stockTotalReals")
  List<StockTotalReal> stockTotalReals;

  TotalTradeRealReply({
    required this.codeReply,
    required this.stockTotalReals,
  });

  factory TotalTradeRealReply.fromJson(Map<String, dynamic> json) =>
      _$TotalTradeRealReplyFromJson(json);

  Map<String, dynamic> toJson() => _$TotalTradeRealReplyToJson(this);
}

@JsonSerializable()
class CodeReply {
  @JsonKey(name: "codeID")
  String codeId;
  @JsonKey(name: "codeName")
  String codeName;

  CodeReply({
    required this.codeId,
    required this.codeName,
  });

  factory CodeReply.fromJson(Map<String, dynamic> json) =>
      _$CodeReplyFromJson(json);

  Map<String, dynamic> toJson() => _$CodeReplyToJson(this);
}

@JsonSerializable()
class StockTotalReal {
  @JsonKey(name: "close")
  double close;
  @JsonKey(name: "date")
  DateTime date;
  @JsonKey(name: "high")
  double high;
  @JsonKey(name: "low")
  double low;
  @JsonKey(name: "open")
  double open;
  @JsonKey(name: "ticker")
  String ticker;
  @JsonKey(name: "vol")
  int vol;

  StockTotalReal({
    required this.close,
    required this.date,
    required this.high,
    required this.low,
    required this.open,
    required this.ticker,
    required this.vol,
  });

  factory StockTotalReal.fromJson(Map<String, dynamic> json) =>
      _$StockTotalRealFromJson(json);

  Map<String, dynamic> toJson() => _$StockTotalRealToJson(this);
}

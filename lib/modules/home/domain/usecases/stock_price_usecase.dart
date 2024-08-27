import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/core/exceptions/data_error.dart';
import 'package:getx_structure/modules/home/domain/models/request_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/repositories/stock_price_repository.dart';

class StockPriceUseCase {
  final StockPriceRepository repository;

  StockPriceUseCase({required this.repository});
   Future<Either<DataError, ResponsetModelStockPrice>> getStockPrice(
          {required RequestModelStockPrice
              requestModelStockPrice}) async =>
      repository.getStockPrice(
          requestModelStockPrice: requestModelStockPrice);
}
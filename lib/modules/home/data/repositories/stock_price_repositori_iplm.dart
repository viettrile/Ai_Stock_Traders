import 'package:fpdart/src/either.dart';
import 'package:getx_structure/core/exceptions/data_error.dart';
import 'package:getx_structure/modules/home/data/datasource/stock_price_datasource.dart';
import 'package:getx_structure/modules/home/domain/models/request_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/repositories/stock_price_repository.dart';

class StockPriceRepositoryImpl implements StockPriceRepository {
  final StockPriceDataSource dataSource;

  StockPriceRepositoryImpl({required this.dataSource});

  @override
  Future<Either<DataError, ResponsetModelStockPrice>> getStockPrice(
      {required RequestModelStockPrice requestModelStockPrice}) async {
    return dataSource.getStockPrice(
        requestModelStockPrice: requestModelStockPrice);
  }
}

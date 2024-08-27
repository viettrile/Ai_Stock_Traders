import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:getx_structure/core/exceptions/data_error.dart';
import 'package:getx_structure/modules/home/data/datasource/stock_price_datasource.dart';
import 'package:getx_structure/modules/home/domain/models/request_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:getx_structure/services/network/dio_provider.dart';

class StockPriceDataSourceImpl implements StockPriceDataSource {
  final Dio dio;

  StockPriceDataSourceImpl({required this.dio});

  

  @override
  Future<Either<DataError, ResponsetModelStockPrice>> getStockPrice(
      {required RequestModelStockPrice requestModelStockPrice}) async {
    try {
      final response = await dio.post(
          '${DioProvider.baseUrl}${DioProvider.endPointStockPrice}',
          data: requestModelStockPrice.toJson());
      if (response.data == null || response.data.length == 0) {
        return Left(DataError(message: "Response data is null"));
      }
      return Right(ResponsetModelStockPrice.fromJson(response.data));
    } catch (e) {
      return DataError.handleException(e);
    }
  }

}

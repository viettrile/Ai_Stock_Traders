import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_structure/core/base/base_getx_controller.dart';
import 'package:getx_structure/modules/home/domain/models/request_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:getx_structure/modules/home/domain/usecases/stock_price_usecase.dart';

class HomeController extends BaseGetxController {
  final StockPriceUseCase stockPriceUseCase;
  final RxList<StockTotalReal> _stockList = <StockTotalReal>[].obs;
  final RxList<StockTotalReal> _filteredStockData = <StockTotalReal>[].obs;
  final RxString selectedTicker = ''.obs; // Để lưu ticker được chọn

  List<StockTotalReal> get stockList => _stockList;
  List<StockTotalReal> get filteredStockData => _filteredStockData;
  final isLoading = false.obs;
  final currentPage = 0.obs;
  final rowsPerPage = 50; // số dòng mỗi trang
  Timer? _timer;

  HomeController({required this.stockPriceUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchStockPriceData(); // Lấy dữ liệu ban đầu
    // _startFetchingDataEvery300(); // Bắt đầu periodic fetch
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startFetchingDataEvery300() {
    _timer = Timer.periodic(Duration(seconds: 300), (timer) {
      fetchStockPriceData();
    });
  }

  Future<void> fetchStockPriceData({String? selectedTicker}) async {
    isLoading(true);
    var requestModel = RequestModelStockPrice(
      totalTradeRealRequest: TotalTradeRealRequest(account: "StockTraders"),
    );

    final result = await stockPriceUseCase.getStockPrice(
        requestModelStockPrice: requestModel);

    result.fold(
      (error) {
        print('Error fetching stock data: ${error.message}');
      },
      (data) {
        _stockList.value = data.totalTradeRealReply.stockTotalReals;

        // Lọc dữ liệu theo ticker nếu có chọn
        if (selectedTicker != null) {
          _filteredStockData.value = _stockList
              .where((stock) => stock.ticker == selectedTicker)
              .take(rowsPerPage)
              .toList();
        } else {
          // Khởi tạo dữ liệu hiển thị ban đầu chỉ với rowsPerPage
          _filteredStockData.value = _stockList.take(rowsPerPage).toList();
        }
      },
    );

    isLoading(false);
  }

  void loadMoreStockData() {
    final newPage = currentPage.value + 1;
    currentPage.value = newPage;

    // Kiểm tra xem còn dữ liệu để tải không
    final paginatedData = _stockList
        .where((stock) => _filteredStockData
            .any((filtered) => filtered.ticker == stock.ticker))
        .skip(newPage * rowsPerPage)
        .take(rowsPerPage)
        .toList();

    if (paginatedData.isNotEmpty) {
      _filteredStockData.addAll(paginatedData);
    }
  }

  void filterStockData(String query) {
    _filteredStockData.value = _stockList
        .where(
            (stock) => stock.ticker.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void updateStockDataByTicker(String ticker) {
    _filteredStockData.value =
        _stockList.where((stock) => stock.ticker == ticker).toList();
  }
}

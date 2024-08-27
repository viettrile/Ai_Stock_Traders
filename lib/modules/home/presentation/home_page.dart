import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/core/common_widgets/keyboard_dismisser.dart';
import 'package:getx_structure/modules/home/presentation/controller/home_controller.dart';
import 'package:getx_structure/modules/home/presentation/widget/stock_table_widget.dart';
import 'package:getx_structure/modules/home/presentation/widget/stock_chart_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(title: Text('Realtime Stock Dashboard')),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.stockList.isEmpty) {
            return Center(child: Text('No stock data available'));
          } else {
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: StockChart(), 
                ),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StockTable(
                      stockData: controller.filteredStockData,
                      onSearch: controller.filterStockData,
                      onLoadMore: controller.loadMoreStockData,
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

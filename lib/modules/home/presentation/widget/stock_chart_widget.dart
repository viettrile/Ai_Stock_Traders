import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:getx_structure/modules/home/presentation/controller/home_controller.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';

class StockChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      return Column(
        children: [
          DropdownButton<String>(
            value: controller.selectedTicker.value.isEmpty
                ? null
                : controller.selectedTicker.value,
            hint: Text('Select Ticker'),
            items: controller.stockList.map((StockTotalReal stock) {
              return DropdownMenuItem<String>(
                value: stock.ticker,
                child: Text(stock.ticker),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.selectedTicker.value = newValue;
                controller.updateStockDataByTicker(newValue);
              }
            },
          ),
          Expanded(
            child: ListView(
              controller: ScrollController(),
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Stock Price Analysis'),
                    primaryXAxis: DateTimeAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      dateFormat: DateFormat.MMMd(),
                      majorGridLines: MajorGridLines(width: 0.9),
                      intervalType: DateTimeIntervalType.days,
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(text: 'Stock Price'),
                      opposedPosition: true,
                      majorGridLines: MajorGridLines(width: 0.5),
                    ),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      // Candlestick series for stock data
                      CandleSeries<StockTotalReal, DateTime>(
                        dataSource: controller.filteredStockData,
                        xValueMapper: (StockTotalReal stock, _) => stock.date,
                        lowValueMapper: (StockTotalReal stock, _) => stock.low,
                        highValueMapper: (StockTotalReal stock, _) =>
                            stock.high,
                        openValueMapper: (StockTotalReal stock, _) =>
                            stock.open,
                        closeValueMapper: (StockTotalReal stock, _) =>
                            stock.close,
                        name: 'Stock',
                        enableTooltip: true,
                      ),
                      // Line series for MACD (Example of another technical indicator)
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

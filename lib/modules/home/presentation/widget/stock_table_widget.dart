import 'package:flutter/material.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:getx_structure/modules/home/presentation/widget/data_table_source.dart';

class StockTable extends StatelessWidget {
  final List<StockTotalReal> stockData;
  final Function(String) onSearch;
  final VoidCallback onLoadMore;

  const StockTable({
    super.key,
    required this.stockData,
    required this.onSearch,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    final stockTableDataSource = StockTableDataSource(stockData);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: TextField(
            onChanged: onSearch,
            decoration: const InputDecoration(
              labelText: 'Tìm kiếm mã chứng khoán',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 16),
        PaginatedDataTable(
          header: Text(
            'Giá chứng khoán',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ), // Highlight header
          rowsPerPage: 10,
          columnSpacing: 16, // Increase spacing between columns
          onPageChanged: (int page) {
            onLoadMore(); // Call callback to load more data
          },
          columns: const [
            DataColumn(
                label: Text('Ticker',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Date',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Open',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('High',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('Low', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Close',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Volume',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          source: stockTableDataSource,
        ),
      ],
    );
  }
}

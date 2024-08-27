import 'package:flutter/material.dart';
import 'package:getx_structure/modules/home/domain/models/response_model_stock_price.dart';
import 'package:intl/intl.dart';

// Function to format date
String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

class StockTableDataSource extends DataTableSource {
  final List<StockTotalReal> _stockData;

  StockTableDataSource(this._stockData);

  @override
  DataRow getRow(int index) {
    if (index >= _stockData.length) return DataRow(cells: []);
    final stock = _stockData[index];

    final cellColor = stock.close > stock.open
        ? Colors.green[100]
        : stock.close < stock.open
            ? Colors.red[100]
            : Colors.grey[200];

    return DataRow(
      cells: [
        DataCell(Text(stock.ticker)),
        DataCell(Text(formatDate(stock.date))),
        DataCell(Text(stock.open.toString())),
        DataCell(Text(stock.high.toString())),
        DataCell(Text(stock.low.toString())),
        DataCell(Text(stock.close.toString())),
        DataCell(Text(stock.vol.toString())),
      ],
      color: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          return cellColor; // Apply the background color for the entire row
        },
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _stockData.length;

  @override
  int get selectedRowCount => 0;
}

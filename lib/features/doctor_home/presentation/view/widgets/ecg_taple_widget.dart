import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';

class ECGTable extends StatelessWidget {
  const ECGTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(50),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.ecgReading,
              style: AppStyles.semiBold20(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 2,
                      color: AppColors
                          .primaryColor), // Internal horizontal borders
                  verticalInside: BorderSide(
                      width: 2,
                      color:
                          AppColors.primaryColor), // Internal vertical borders
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                },
                children: [
                  _buildRow(["((ECG))", "ONSET", "OFFSET", "PEAK"]),
                  _buildRow(["P", "X", "X", "X"]),
                  _buildQRSRow(),
                  _buildRow(["T", "X", "x", "X"]),
                  _buildRow(["R", "X", "X", "X"]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow(List<String> titles) {
    return TableRow(
      children: titles.map((title) => _buildCell(title, bold: true)).toList(),
    );
  }

  TableRow _buildRow(List<String> values) {
    return TableRow(
      children: values.map((value) => _buildCell(value)).toList(),
    );
  }

  TableRow _buildQRSRow() {
    return TableRow(
      children: [
        _buildCell(
          "QRS",
        ),
        _buildCell("X"),
        _buildCell("X"),
        _buildStackedQRSCell(),
      ],
    );
  }

  Widget _buildStackedQRSCell() {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
            width: 1,
            color: AppColors.primaryColor), // Internal horizontal borders
        verticalInside: BorderSide(
            width: 1,
            color: AppColors.primaryColor), // Internal vertical borders
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      children: [
        _buildHeaderRow(["Q", "x"]),
        _buildRow(["S", "X"]),
      ],
    );
  }

  Widget _buildCell(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}

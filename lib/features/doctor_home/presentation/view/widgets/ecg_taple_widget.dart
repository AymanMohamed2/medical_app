import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/base_patient_vitals_model.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class ECGTable extends StatelessWidget {
  const ECGTable({super.key});

  @override
  Widget build(BuildContext context) {
    BasePatientVitalsModel data =
        context.read<FetchPatientVitalsCubit>().basePatientVitalsModel!;
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
                  _buildRow([
                    "P",
                    data.p[0],
                    data.p[1],
                    data.p[2],
                  ]),
                  _buildQRSRow(data),
                  _buildRow(["T", data.t[0], data.t[1], data.t[2]]),
                  _buildRow(["R", data.r[0], data.r[1], data.r[2]]),
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

  TableRow _buildQRSRow(BasePatientVitalsModel data) {
    return TableRow(
      children: [
        _buildCell(
          "QRS",
        ),
        _buildCell(data.qrs[0]),
        _buildCell(data.qrs[1]),
        _buildStackedQRSCell(data),
      ],
    );
  }

  Widget _buildStackedQRSCell(BasePatientVitalsModel data) {
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
        _buildHeaderRow(["Q", data.qPeak!]),
        _buildRow(["S", data.sPeak!]),
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

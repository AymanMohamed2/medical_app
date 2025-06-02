import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/features/auth/presentation/view/doctor_sign_up_view.dart';
import 'package:medical_app/features/auth/presentation/view/patient_sign_up_view.dart';

class ChooseRuleViewBody extends StatelessWidget {
  const ChooseRuleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PatientSignUpView(),
                ),
              );
            },
            child: SvgPicture.asset(Assets.imagesPatient)),
        Text(AppStrings.patient,
            textAlign: TextAlign.center, style: AppStyles.medium20(context)),
        SizedBox(
          height: 60,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DoctorSignUpView(),
                ),
              );
            },
            child: SvgPicture.asset(Assets.imagesDoctor)),
        Text(AppStrings.doctor,
            textAlign: TextAlign.center, style: AppStyles.medium20(context)),
      ],
    );
  }
}

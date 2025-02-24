import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/alerts/presentation/views/widgets/danger_alert_message.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/fetures/alerts/presentation/views/widgets/doctor_alert_message.dart';

class AlertsViewBody extends StatelessWidget {
  const AlertsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.appBarAlerts,
            onPressed: () {},
          ),
          DoctorAlertMessage(
            title: 'Dr. John Doe',
            subTitle:
                'Your session has been confirmed to date 27,5,2025 7:00 PM',
            imageUrl:
                'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*',
          ),
          DangerAlertMessage(
            icon: FontAwesomeIcons.heartPulse,
            title: 'High heart rate, consider consulting a doctor.',
            date: '25,5,2025',
            time: '9:00 PM',
          ),
          DoctorAlertMessage(
            title: 'Dr. Evelyn Harper',
            subTitle:
                'Your session has been confirmed to date 11,1,2025 1:30 PM',
            imageUrl:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
          ),
          DangerAlertMessage(
            icon: FontAwesomeIcons.temperatureThreeQuarters,
            title:
                'High Temperature, consider cooling down or consult a doctor.',
            date: '25,5,2025',
            time: '9:00 PM',
          ),
          DoctorAlertMessage(
            title: 'Dr. Ayman Mohamed',
            subTitle:
                'Your session has been confirmed to date 22,2,2025 8:00 PM',
            imageUrl:
                'https://familydoctor.org/wp-content/uploads/2018/02/41808433_l-848x566.jpg',
          ),
          DangerAlertMessage(
            icon: FontAwesomeIcons.droplet,
            title: 'Low Oxygen percentage, consider consulting a doctor.',
            date: '25,5,2025',
            time: '9:00 PM',
          ),
        ],
      ),
    );
  }
}

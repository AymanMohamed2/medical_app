import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/doctor_home/presentation/view/doctor_home_view.dart';
import 'package:medical_app/features/doctor_profile/presentation/view/doctor_profile_view.dart';

class DoctorBottomNavBarView extends StatefulWidget {
  const DoctorBottomNavBarView({super.key});

  @override
  State<DoctorBottomNavBarView> createState() =>
      _PatientBottomNavBarViewState();
}

class _PatientBottomNavBarViewState extends State<DoctorBottomNavBarView> {
  int _index = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DoctorHomeView(),
    DoctorProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconSize: 32,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(_index != 0 ? Icons.home_outlined : Icons.home),
              label: AppStrings.home),
          BottomNavigationBarItem(
              icon: _index != 1
                  ? Icon(Icons.person_outlined)
                  : Icon(Icons.person),
              label: AppStrings.profile),
        ],
        unselectedItemColor: AppColors.inactiveColor,
        currentIndex: _index,
        selectedItemColor: AppColors.activeColor,
        onTap: _onTapped,
      ),
    );
  }

  _onTapped(value) {
    setState(() {
      _index = value;
    });
  }
}
